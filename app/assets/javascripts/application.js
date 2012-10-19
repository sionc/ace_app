// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require bootstrap
//= require base
//= require_tree .

$(function() {
    var pathname = window.location.pathname;
    if (pathname == "/pages/monitor") {
      $("#home_tab").removeClass("active");
      $("#monitor_tab").addClass("active");
      $("#reports_tab").removeClass("active");
    } else if (pathname == "/pages/reports") {
      $("#home_tab").removeClass("active");
      $("#monitor_tab").removeClass("active");
      $("#reports_tab").addClass("active");
    } else {
      $("#home_tab").addClass("active");
      $("#monitor_tab").removeClass("active");
      $("#reports_tab").removeClass("active");
    }
});