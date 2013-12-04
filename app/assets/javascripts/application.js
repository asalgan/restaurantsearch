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
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function() {

	$('#notes').on("click", "li", function() {
    $.ajax({url: "/notes/" + $(this).data("note-id") + "/edit", dataType: "script"});
    
  })
});


$('div.checkbox').each(function(){
  
  var LiN = $(this).find('label').length;
  
  if( LiN > 3){    
    $('label', this).eq(2).nextAll().hide().addClass('toggleable');
    $(this).append('<label class="more">More...</label>');    
  }
  
});


$('div.checkbox').on('click','.more', function(){
  
  if( $(this).hasClass('less') ){    
    $(this).text('More...').removeClass('less');    
  }else{
    $(this).text('Less...').addClass('less'); 
  }
  
  $(this).siblings('label.toggleable').slideToggle();
    
}); 