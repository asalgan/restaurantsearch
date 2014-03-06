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
//= require jquery.geocomplete
//= require_tree .

$(document).ready(function() {

  $('.selectpicker').selectpicker();

  $('#Grid .fa-star').click(function() {
    var mix = $(this).closest(".mix");
    var food_id = mix.attr("id");
    $.ajax({
      type: "POST",
      url: "/add_item_to_user",
      data: {
        menu_id: food_id
      },
      success: function (data) {
        console.log('yay');
        // mix.addClass('favorite');
      }
    });
  });
    

  $('#Grid').mixitup();

  /* Activating Best In Place */
  $(".best_in_place").best_in_place();

  $("#zipcode").geocomplete({
   country: 'us' // Option 1: Call on element.
	 // map: ".map-canvas" // Option 2: Pass element as argument.
  }); 
});



