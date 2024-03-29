var processManagerData;
var dataItems = {};
var ppmBySource = {};
var ppmChart;
var ipmChart;

// Setup the Ajax token for Javascript
var setupAjax = function() {
    $.ajaxSetup({
        beforeSend : function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
	  }
    });
};

// Get process manager data
var getCurrentProcessManagerData = function() {
    $.ajax({
        type: 'GET',
        url: '/process_managers/get_current_statistics',
        dataType: 'json',
        timeout:5000,
        success: function(data){
            processManagerData = jQuery.parseJSON(JSON.stringify(data));

            var entryId = processManagerData.entry_id;
            var entryTimestamp = processManagerData.entry_timestamp;
            var isCurrent = true; //IsEntryCurrent(entryId, entryTimestamp);

            var numSources = processManagerData.statistics_sources.length;
            for(var i = 0; i < numSources; i++) {
                var source = processManagerData.statistics_sources[i];
                var numItems = source.data_items.length;
                for (var j = 0; j < numItems; j++) {
                    var item = source.data_items[j];
                    var id = getDataItemIdentifier(source.path, item.name);

                    // If last entry is not current, then set the data item values to default
                    if (!isCurrent)
                        item.current_value = item.default_value;

                    dataItems[id] = item;

                    if (item.name == "Instances Per Minute" || item.name == "Parts Per Minute") {
                        if (item.current_value > 0)
                            item.current_value = Math.round((item.current_value + (Math.random() * 20)) * 100)/100;

                        ppmBySource[source.path] = { type: source.type,
                                                     current_value: item.current_value};
                    }
                }
            }

            updateDataItemValues();
            updatePpmValues();
            updateLineChart(ppmChart);
            updateLineChart(ipmChart);
        }
    });
};

var IsEntryCurrent = function(entryId, entryTimestamp) {
   var now = new Date();
   var curTime = Date.UTC(now.getUTCFullYear(), now.getUTCMonth(), now.getUTCDate(),
       now.getUTCHours(), now.getUTCMinutes(), now.getUTCSeconds());

   curTime = curTime/1000;
   var acceptableOffset = 5; // two minutes

   return Math.abs(curTime - entryTimestamp) < acceptableOffset;
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
       var curVal = ppmBySource[sourcePath].current_value;
       $(this).text(curVal);
   });
};

var initializePpmBySource = function () {
   $('[id$="-ppm"]').each(function() {
       var s = $(this).attr('id');
       var pos = s.indexOf("-ppm");
       var sourcePath = s.substr(0, pos);
       var sourceType = sourcePath.substr(0, sourcePath.indexOf(":"));
       ppmBySource[sourcePath] = {type: sourceType,
                                  current_value: parseFloat($(this).text())};
   });
};

var getDataItemIdentifier = function(sourcePath, dataItemName) {
     return sourcePath + "/" + dataItemName;
};

var initializePartsPerMinuteChart = function() {
   Highcharts.setOptions({
		global: {
			useUTC: false
		}
	});

    var series = [];
    var time =  (new Date()).getTime();
    for (var source in ppmBySource){
        var type = ppmBySource[source].type;
        if (!(type == "Robot" || type == "Process Manager")) {
            continue;
        }
        var current_value = ppmBySource[source].current_value;

        series.push({
            name:source,
            data:(function() {
				var data = [];

				for (var i = -19; i <= 0; i++) {
					data.push({
						x: time + i * 2000,
						y: current_value
					});
				}
				return data;
			})()
        });
    }

	ppmChart = new Highcharts.Chart({
		chart: {
			renderTo: 'live-ppm-chart-container',
			type: 'spline',
			marginRight: 10,
            backgroundColor: 'transparent',
            borderColor: 'transparent',
            borderWidth: '1',
            plotBackgroundColor: 'transparent',
            height: 280
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
                    '<b>'+ Highcharts.numberFormat(this.y, 2) + '</b>' + ' at ' +
                    Highcharts.dateFormat('%H:%M:%S', this.x) ;
			}
		},
		legend: {
			enabled: true
		},
		exporting: {
			enabled: false
		},
		series: series
	});
};

var updateLineChart = function(chart) {
      // set up the updating of the chart each second
    var s = chart.series;
    var numSeries = s.length;
    var x = (new Date()).getTime();
    for (var i = 0; i < numSeries; i++) {
        var curSeries = s[i];
        var currentData = ppmBySource[curSeries.name].current_value;
        curSeries.addPoint([x, currentData], true, true);
    }
};

var initializeBeltInstancesPerMinuteChart = function() {
   Highcharts.setOptions({
		global: {
			useUTC: false
		}
	});

   var series = [];
   var time =  (new Date()).getTime();
   for (var source in ppmBySource){
       var type = ppmBySource[source].type;
       if (type != "Belt") {
           continue;
       }
       var current_value = ppmBySource[source].current_value;

       series.push({
           name:source,
           data:(function() {
               var data = [];

               for (var i = -19; i <= 0; i++) {
                   data.push({
                       x: time + i * 2000,
                       y: current_value
                   });
               }
               return data;
           })()
       });
    }

	ipmChart = new Highcharts.Chart({
		chart: {
			renderTo: 'live-belt-ipm-chart-container',
			type: 'spline',
			marginRight: 10,
            backgroundColor: 'transparent',
            borderColor: 'transparent',
            borderWidth: '1',
            plotBackgroundColor: 'transparent',
            height: 280
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
				text: 'Instances Per Minute'
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
                    '<b>'+ Highcharts.numberFormat(this.y, 2) + '</b>' + ' at ' +
                    Highcharts.dateFormat('%H:%M:%S', this.x) ;
			}
		},
		legend: {
			enabled: true
		},
		exporting: {
			enabled: false
		},
		series: series
	});
};

var initializeStatisticsSummary = function() {
    $("#stat-summary-accordion").accordion({
        heightStyle: "content",
        collapsible: true,
        active: false
    });
};

$(function(){
   if ($("#live-ppm-chart-container").length == 0)
        return;

   setupAjax();
   initializeStatisticsSummary();
   initializePpmBySource();
   initializePartsPerMinuteChart();

   if ($("#live-belt-ipm-chart-container").length == 0)
        return;

   initializeBeltInstancesPerMinuteChart();

   var intervalID = setInterval(getCurrentProcessManagerData, 2000);

   // To clear periodic update
   // clearInterval(intervalID);
});

