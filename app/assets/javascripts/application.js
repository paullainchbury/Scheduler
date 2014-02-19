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
    var start = new Date(start_date);
    var endtime = new Date(end_date);

    var oneDay = 24*60*60*1000; // hours*minutes*seconds*milliseconds

    var diffDays = Math.abs((start.getTime() - endtime.getTime())/(oneDay));

    console.log("Start day: " + start.getDay());
    console.log("End day: " + endtime.getDay());
    console.log("The course runs over " + (diffDays+1) + " days");

    if ((diffDays+1) >= 7) {
      console.log("Need to show each day");
    } else {
      date = new Date(start.getTime());
      do {
        // date = new Date(date.getTime());
        console.log("Day " + date.getDay() + ", ");
        date = new Date(date.getTime() + 86400000);
      } while (date.getTime() <= endtime.getTime());

    }
  }
};
