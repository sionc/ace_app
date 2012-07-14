var displayWeeklyProgressChart = function() {
   if ($("#weekly-progress-chart").length == 0)
        return;

	var colors = Highcharts.getOptions().colors,
		categories = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'],
		name = 'Weekly Progress',
		data = [{
				y: 2544 ,
				color: colors[0],
				drilldown: {
					name: 'Mon',
					categories: ['1-2pm', '2-3pm', '3-4pm', '4-5pm', '5-6pm', '6-7pm', '7-8pm', '8-9pm'],
					data: [320, 280, 300, 310, 250, 290, 250, 330],
					color: colors[0]
				}
			}, {
				y: 2683,
				color: colors[1],
				drilldown: {
					name: 'Tue',
					categories: ['1-2pm', '2-3pm', '3-4pm', '4-5pm', '5-6pm', '6-7pm', '7-8pm', '8-9pm'],
					data: [320, 280, 300, 310, 250, 290, 250, 330],
					color: colors[1]
				}
			}, {
				y: 2375,
				color: colors[2],
				drilldown: {
					name: 'Wed',
					categories: ['1-2pm', '2-3pm', '3-4pm', '4-5pm', '5-6pm', '6-7pm', '7-8pm', '8-9pm'],
					data: [320, 280, 300, 310, 250, 290, 250, 330],
					color: colors[2]
				}
			}, {
				y: 2592,
				color: colors[3],
				drilldown: {
					name: 'Thu',
					categories: ['1-2pm', '2-3pm', '3-4pm', '4-5pm', '5-6pm', '6-7pm', '7-8pm', '8-9pm'],
					data: [320, 280, 300, 310, 250, 290, 250, 330],
					color: colors[3]
				}
			}, {
				y: 2621,
				color: colors[4],
				drilldown: {
					name: 'Fri',
					categories: ['1-2pm', '2-3pm', '3-4pm', '4-5pm', '5-6pm', '6-7pm', '7-8pm', '8-9pm'],
					data: [320, 280, 300, 310, 250, 290, 250, 330],
					color: colors[4]
				}
			}];

	function setChart(name, categories, data, color) {
		chart.xAxis[0].setCategories(categories);
		chart.series[0].remove();
		chart.addSeries({
			name: name,
			data: data,
			color: color || 'white'
		});
	}

	var chart = new Highcharts.Chart({
		chart: {
			renderTo: 'weekly-progress-chart',
			type: 'column'
		},
		title: {
			text: ''
		},
		subtitle: {
			text: 'Click the columns to view hourly progress. Click again to return.'
		},
		xAxis: {
			categories: categories
		},
		yAxis: {
			title: {
				text: ''
			}
		},
		plotOptions: {
			column: {
				cursor: 'pointer',
				point: {
					events: {
						click: function() {
							var drilldown = this.drilldown;
							if (drilldown) { // drill down
								setChart(drilldown.name, drilldown.categories, drilldown.data, drilldown.color);
							} else { // restore
								setChart(name, categories, data);
							}
						}
					}
				},
				dataLabels: {
					enabled: true,
					color: colors[0],
					style: {
						fontWeight: 'bold'
					},
					formatter: function() {
						return this.y;
					}
				}
			}
		},
		tooltip: {
			formatter: function() {
				var point = this.point,
					s = this.x +':<b>'+ this.y +' parts processed</b><br/>';
				if (point.drilldown) {
					s += 'Click to view '+ point.category +'\'s hourly progress';
				} else {
					s += 'Click to return to progress for the week';
				}
				return s;
			}
		},
		series: [{
			name: name,
			data: data,
			color: 'white'
		}],
		exporting: {
			enabled: false
		},
        credits: {
            enabled:false
        },
        legend: {
            enabled:false
        }
	});

};

var displayProductDistributionChart = function() {
     if ($("#product-distribution-chart").length == 0)
        return;

    var chart;

    chart = new Highcharts.Chart({
		chart: {
			renderTo: 'product-distribution-chart',
			plotBackgroundColor: null,
			plotBorderWidth: null,
			plotShadow: false
		},
        credits: {
            enabled:false
        },
		title: {
			text: ''
		},
		tooltip: {
			formatter: function() {
				return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
			}
		},
		plotOptions: {
			pie: {
				allowPointSelect: true,
				cursor: 'pointer',
				dataLabels: {
					enabled: true,
					color: '#000000',
					connectorColor: '#000000',
					formatter: function() {
						return '<b>'+ this.point.name +'</b>: '+ this.percentage +' %';
					}
				}
			}
		},
		series: [{
			type: 'pie',
			name: 'Product distribution',
			data: [
				['Product A',   45.4],
				['Product B',       26.8],
				{
					name: 'Product A',
					y: 12.8,
					sliced: true,
					selected: true
				},
				['Product C',    8.8],
				['Product D',     6.2]
			]
		}]
	});
};

$(function() {
    displayWeeklyProgressChart();
    displayProductDistributionChart();
});

