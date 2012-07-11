var chart;
$(document).ready(function() {
	chart = new Highcharts.Chart({
		chart: {
			renderTo: 'hourly-parts-processed-chart',
			type: 'column',
            backgroundColor: 'transparent',
            borderColor: 'transparent',
            borderWidth: '1',
            plotBackgroundColor: 'transparent'
		},
		title: {
			text: ''
		},
		xAxis: {
			categories: [
				'1 pm',
				'2 pm',
				'3 pm',
				'4 pm',
				'5 pm',
				'6 pm',
				'7 pm',
                '8 pm'
			]
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
				return ''+
					this.x +': '+ this.y +' parts processed';
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
			data: [200, 220, 170, 320, 180, 220, 190, 210],
            color: '#FFC774'

		}]
	});
});