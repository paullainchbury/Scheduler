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
//= require jquery_ujs
//= require foundation

//= require_tree .


// $(function(){ $(document).foundation(); });

$(document).ready( function() {
    $("input[name=end_date]").change(function() {dateRange(); });
    $("input[name=start_date]").change(function() {dateRange(); });
});

function dateRange() { 
      var start_date = $("input[name=start_date]").val();
      var end_date = $("input[name=end_date]").val();
      
      if ((start_date != '') && (end_date != '')) {
        // If date range is more than 7 days, just show all the days
        var start = new Date(start_date);
        var endtime = new Date(end_date);
        console.log(start);
        console.log(endtime);
        // loop through each date in the range and get a uniq array of daynumbers.
        console.log(start.getDay());

        // Need to work out which days of the week are included in the date range.


        // Then need to display the divs with the id of the days of the week which correspond to the days that fall in the date range.
      }
    };
