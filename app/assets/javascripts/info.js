var posts = [];
var currentData = 10;

// Setup the Ajax token for Javascript
var setupAjax = function() {
    $.ajaxSetup({
        beforeSend : function(xhr) {
            xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content'));
	  }
    });
};

var createPost = function(comment) {
    $.ajax({
        type: 'POST',
        url: '/posts',
        data:{post:{comment:comment}},
        dataType: 'json',
        timeout:20000,
        async:false,
        success: function(data) {
           var postObj = jQuery.parseJSON(JSON.stringify(data));
           updatePosts(postObj.comment, postObj.owner);
        }
    });
};

var getPosts = function() {
    $.ajax({
        type: 'GET',
        url: '/posts',
        dataType: 'json',
        timeout:20000,
        success: parsePosts
    });
};

var parsePosts = function(postData) {
    var numPosts = postData.posts.length;
    var i = 0;
    for (i = 0; i < numPosts; i++) {
        var postObj = jQuery.parseJSON(JSON.stringify(postData.posts[i]));
        posts.push(postObj);
    }

    initializePosts();
};

var initializePosts = function() {
    var i = 0;

    for (i = 0; i < posts.length; i++) {
        var comment = posts[i].comment;
        var owner = posts[i].owner;
        updatePosts(comment, owner);
    }
};

var updatePosts = function(comment, owner) {
    var commentsContainer =  "#comments-container";
    if($(commentsContainer).length == 0)
        return;

    $("<blockquote><p>"+comment+"</p><small>"+owner+"</small></blockquote>").appendTo(commentsContainer);
};

// Get test data
var getTestData = function() {
    $.ajax({
        type: 'GET',
        url: '/tests/1',
        dataType: 'json',
        timeout:2000,
        success: function(data){
            currentData = parseInt(data.data);
        }
    });
};

// Initialize test data chart
var initializeTestDataChart = function() {
   Highcharts.setOptions({
		global: {
			useUTC: false
		}
	});

	var chart = new Highcharts.Chart({
		chart: {
			renderTo: 'live-data-chart-container',
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

   if ($("#share-feedback").length == 0)
        return;

   getPosts();

   $("#comment-textarea").val('');
   $("#share-feedback").click( function(){
       var comment = $("#comment-textarea").val();
       createPost(comment);
       $("#comment-textarea").val('');
   });

   if ($("#live-data-chart-container").length == 0)
        return;

   initializeTestDataChart();
});