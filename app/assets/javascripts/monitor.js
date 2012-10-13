var currentData = 10;

// Setup the Ajax token for Javascript
var setupAjax = function() {
    $.ajaxSetup({
        beforeSend : function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
	  }
    });
};

// Get test data
var getTestData = function() {
    $.ajax({
        type: 'GET',
        url: '/tests/2',
        dataType: 'json',
        timeout:2000,
        success: function(data){
            currentData = parseInt(data.data);
        }
    });
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
                        getTestData();

						var x = (new Date()).getTime(); // current time
						series.addPoint([x, currentData], true, true);
					}, 2000);
				}
			},
            backgroundColor: 'transparent',
            borderColor: 'transparent',
            borderWidth: '1',
            plotBackgroundColor: 'transparent'
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
				text: 'Value'
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
			enabled: false
		},
		exporting: {
			enabled: false
		},
		series: [{
			name: 'Random data',
			data: (function() {
				// generate an array of random data
				var data = [],
					time = (new Date()).getTime(),
					i;

				for (i = -19; i <= 0; i++) {
					data.push({
						x: time + i * 1000,
						y: Math.random()
					});
				}
				return data;
			})()
		}]
	});
};

var initializeLiveRobotDataChart = function() {
   Highcharts.setOptions({
		global: {
			useUTC: false
		}
	});

	var chart = new Highcharts.Chart({
		chart: {
			renderTo: 'live-robot-data-chart-container',
			type: 'spline',
			marginRight: 10,
			events: {
				load: function() {

					// set up the updating of the chart each second
					var series = this.series[0];
					setInterval(function() {
                        getTestData();

						var x = (new Date()).getTime(); // current time
						series.addPoint([x, currentData], true, true);
					}, 2000);
				}
			},
            backgroundColor: 'transparent',
            borderColor: 'transparent',
            borderWidth: '1',
            plotBackgroundColor: 'transparent'
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
				text: 'Value'
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
			enabled: false
		},
		exporting: {
			enabled: false
		},
		series: [{
			name: 'Random data',
			data: (function() {
				// generate an array of random data
				var data = [],
					time = (new Date()).getTime(),
					i;

				for (i = -19; i <= 0; i++) {
					data.push({
						x: time + i * 1000,
						y: Math.random()
					});
				}
				return data;
			})()
		}]
	});
};

$(function(){
   setupAjax();

   if ($("#live-pm-data-chart-container").length == 0)
        return;

   initializeLivePMDataChart();

   if ($("#live-robot-data-chart-container").length == 0)
        return;

   initializeLiveRobotDataChart();
});