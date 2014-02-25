// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.

//= require jquery
//= require jquery_ujs
//= require best_in_place
//= require bootstrap
//= require jquery.geocomplete
//= require_tree .

$(document).ready(function() {

  $('.selectpicker').selectpicker();

  $('.fa-star').click(function() {
    $(this).toggleClass("star").fadeIn("slow");
  });
    


  $('#Grid').mixitup();

  /* Activating Best In Place */
  $(".best_in_place").best_in_place();

  $("#zipcode").geocomplete({
   country: 'us' // Option 1: Call on element.
	 // map: ".map-canvas" // Option 2: Pass element as argument.
  });

});



