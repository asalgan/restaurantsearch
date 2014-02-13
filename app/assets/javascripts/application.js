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

	// $('#notes').on("click", "li", function() {
 //    $.ajax({url: "/notes/" + $(this).data("note-id") + "/edit", dataType: "script"});
    
 //  });
  $('.selectpicker').selectpicker();

  $('.fa-heart').click(function() {
    $(this).toggleClass( "heart" );
  });
    	

  $('#Grid').mixitup();

  /* Activating Best In Place */
  $(".best_in_place").best_in_place();

  $("#zipcode").geocomplete();  // Option 1: Call on element.
	$.fn.geocomplete("input"); // Option 2: Pass element as argument.

	$("#zipcode").geocomplete({ details: "form" });

  // $(".menu-item-info").hide();
  // $(".fa-angle-double-right").click(function() {
  // 	$(".menu-item-info").eq(this).toggle()

  // });

});


