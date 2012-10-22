
$(document).ready(function() {
    if ($("#hourly-parts-processed-chart").length == 0)
        return;

    var chart;
    var colors = Highcharts.getOptions().colors;
	chart = new Highcharts.Chart({
		chart: {
			renderTo: 'hourly-parts-processed-chart',
			type: 'column',
            backgroundColor: 'transparent',
            borderColor: 'transparent',
            borderWidth: '1',
            plotBackgroundColor: 'transparent',
            width:500,
            height:300,
            credits: {
                enabled:false
            }
		},
		title: {
			text: ''
		},
		xAxis: {
			categories: ['1-2pm', '2-3pm', '3-4pm', '4-5pm', '5-6pm', '6-7pm', '7-8pm']
		},
		yAxis: {
			min: 0,
            title: ''
		},
		credits: {
            enabled: false
        },
        legend: {
            enabled: false
        },
		tooltip: {
			formatter: function() {
				return this.y +' parts processed from ' + this.x;
			}
		},
		plotOptions: {
			column: {
				pointPadding: 0.2,
				borderWidth: 0
			}
		},
			series: [{
			name: 'Parts Processed',
			data: [19200 + parseInt(Math.random() * 2000),
                    19200 - parseInt(Math.random() * 2000),
                    19200 + parseInt(Math.random() * 2000),
                    19200 - parseInt(Math.random() * 2000),
                    19200 + parseInt(Math.random() * 2000),
                    19200 - parseInt(Math.random() * 2000),
                    19200 + parseInt(Math.random() * 2000)],
            color: colors[0]

		}]
	});
});