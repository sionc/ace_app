var partsPerMinute = 0;
var processManagerData;
var dataItems = {};
var ppmBySource = {};

// Setup the Ajax token for Javascript
var setupAjax = function() {
    $.ajaxSetup({
        beforeSend : function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
	  }
    });
};

// Get process manager data
var getProcessManagerData = function() {
    $.ajax({
        type: 'GET',
        url: '/process_managers/get_current_statistics?id=1',
        dataType: 'json',
        timeout:2000,
        success: function(data){
            processManagerData = jQuery.parseJSON(JSON.stringify(data));
            partsPerMinute = processManagerData.statistics_sources[0].data_items[3].current_value;

            var numSources = processManagerData.statistics_sources.length;
            for(var i = 0; i < numSources; i++) {
                var source = processManagerData.statistics_sources[i];
                var numItems = source.data_items.length;
                for (var j = 0; j < numItems; j++) {
                    var item = source.data_items[j];
                    var id = getDataItemIdentifier(source.path, item.name);
                    dataItems[id] = item;

                    if (item.name == "Instances Per Minute" || item.name == "Parts Per Minute") {
                        ppmBySource[source.path] = item.current_value;
                    }

                    if (source.type == "Process Manager" && item.name == "Parts Per Minute") {
                        partsPerMinute = item.current_value;
                    }
                }
            }

            updateDataItemValues();
            updatePpmValues();
        }
    });
};

var updateDataItemValues = function () {
    $('td')
        .filter('.value')
        .each(function() {
            var id = $(this).attr('id');
            var curVal = dataItems[id].current_value;
            var unit = dataItems[id].unit;
            $(this).text(curVal + " " + unit);
        });
};

var updatePpmValues = function () {
   $('[id$="-ppm"]').each(function() {
       var s = $(this).attr('id');
       var pos = s.indexOf("-ppm");
       var sourcePath = s.substr(0, pos);
       var curVal = ppmBySource[sourcePath];
       $(this).text(curVal);
   });
};

var initializePpmBySource = function () {
   $('[id$="-ppm"]').each(function() {
       var s = $(this).attr('id');
       var pos = s.indexOf("-ppm");
       var sourcePath = s.substr(0, pos);
       ppmBySource[sourcePath] = 0.0;
   });
};

var getDataItemIdentifier = function(sourcePath, dataItemName) {
     return sourcePath + "/" + dataItemName;
};

// Initialize test data chart
var initializeLivePMDataChart = function() {
   Highcharts.setOptions({
		global: {
			useUTC: false
		}
	});

	var chart = new Highcharts.Chart({
		chart: {
			renderTo: 'live-pm-data-chart-container',
			type: 'spline',
			marginRight: 10,
			events: {
				load: function() {

					// set up the updating of the chart each second
					var series = this.series[0];
					setInterval(function() {
                        getProcessManagerData();

						var x = (new Date()).getTime(); // current time
						series.addPoint([x, partsPerMinute], true, true);
					}, 2000);
				}
			},
            backgroundColor: 'transparent',
            borderColor: 'transparent',
            borderWidth: '1',
            plotBackgroundColor: 'transparent',
            height: 667
		},
        credits: {
            enabled:false
        },
		title: {
			text: ''
		},
		xAxis: {
			type: 'datetime',
			tickPixelInterval: 150
		},
		yAxis: {
			title: {
				text: 'Parts Per Minute'
			},
			plotLines: [{
				value: 0,
				width: 1,
				color: '#808080'
			}]
		},
		tooltip: {
			formatter: function() {
					return '<b>'+ this.series.name +'</b><br/>'+
					Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
					Highcharts.numberFormat(this.y, 2);
			}
		},
		legend: {
			enabled: true
		},
		exporting: {
			enabled: false
		},
		series: [{
			name: 'Process Manager PPM',
			data: (function() {
				// generate an array of random data
				var data = [],
					time = (new Date()).getTime(),
					i;

				for (i = -19; i <= 0; i++) {
					data.push({
						x: time + i * 1000,
						y: partsPerMinute
					});
				}
				return data;
			})()
		}]
	});
};

var initializeCollapsible = function() {
    $(".stat-summary-button").click(function() {
        //var id = $(this).attr('data-target');

        if ($(this).hasClass("collapsed")) {
            $(this).find('i').removeClass("icon-chevron-down");
            $(this).find('i').addClass("icon-chevron-right");
        } else {
            $(this).find('i').removeClass("icon-chevron-right");
            $(this).find('i').addClass("icon-chevron-down");
        }
    });
};

//var initializeLiveRobotDataChart = function() {
//   Highcharts.setOptions({
//		global: {
//			useUTC: false
//		}
//	});
//
//    var series = [];
//    var time =  (new Date()).getTime();
//    for (var source in ppmBySource){
//        series.push({
//            name:source,
//            data:(function() {
//				// generate an array of random data
//				var data = [],
//					//time = (new Date()).getTime(),
//					i;
//
//				for (i = -19; i <= 0; i++) {
//					data.push({
//						x: time + i * 1000,
//						y: ppmBySource[source]
//					});
//				}
//				return data;
//			})()
//        });
//    }
//
//    //alert(series.length);
//
//	var chart = new Highcharts.Chart({
//		chart: {
//			renderTo: 'live-robot-data-chart-container',
//			type: 'spline',
//			marginRight: 10,
//			events: {
//                load: function() {
//
//                    var numSeries = this.series.length;
//                    for (var i = 0; i < numSeries; i++) {
//                        // set up the updating of the chart each second
//                        var series = this.series[i];
//                        setInterval(function() {
//                            var x = (new Date()).getTime();
//                            var currentData = ppmBySource[series.name];
//                            series.addPoint([x, currentData], true, true);
//                        }, 2000);
//                    }
//                }
//			},
//            backgroundColor: 'transparent',
//            borderColor: 'transparent',
//            borderWidth: '1',
//            plotBackgroundColor: 'transparent'
//		},
//        credits: {
//            enabled:false
//        },
//		title: {
//			text: ''
//		},
//		xAxis: {
//			type: 'datetime',
//			tickPixelInterval: 150
//		},
//		yAxis: {
//			title: {
//				text: 'Value'
//			},
//			plotLines: [{
//				value: 0,
//				width: 1,
//				color: '#808080'
//			}]
//		},
//		tooltip: {
//			formatter: function() {
//					return '<b>'+ this.series.name +'</b><br/>'+
//					Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+
//					Highcharts.numberFormat(this.y, 2);
//			}
//		},
//		legend: {
//			enabled: false
//		},
//		exporting: {
//			enabled: false
//		},
//		series: series
////            [{
////			name: 'Random data',
////			data: (function() {
////				// generate an array of random data
////				var data = [],
////					time = (new Date()).getTime(),
////					i;
////
////				for (i = -19; i <= 0; i++) {
////					data.push({
////						x: time + i * 1000,
////						y: Math.random()
////					});
////				}
////				return data;
////			})()
////		}]
//	});
//};

//var initializeCollapsible = function() {
////    $('div[id|="stat-summary-table"]').on('hidden', function () {
////        alert("hidden");
////    });
//    $('#stat-summary-table-0').on('hidden', function () {
//        alert("hidden");
//    });
//};

$(function(){
   setupAjax();
   getProcessManagerData();
   initializePpmBySource();
   initializeCollapsible();

   if ($("#live-pm-data-chart-container").length == 0)
        return;

   initializeLivePMDataChart();

//   if ($("#live-robot-data-chart-container").length == 0)
//        return;
//
//   initializeLiveRobotDataChart();
});