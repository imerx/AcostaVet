//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require jquery.ui.all
//= require jquery-minicolors
//= require jquery-minicolors-simple_form
//= require jquery.timepicker
//= require datepair
//= require fullcalendar1
//= require underscore
//= require backbone
//= require gallery_slide


   /* Datepicker event */
$(function() {
  $( ".datepicker" ).datepicker({
    dateFormat: "yy-mm-dd"
  });
  $( ".timepicker" ).timepicker({ 'timeFormat': 'h:i A' });
});

/* Navigation */

$(document).ready(function(){

  $(window).resize(function()
  {
    if($(window).width() >= 765){
      $(".sidebar #nav").slideDown(350);
    }
    else{
      $(".sidebar #nav").slideUp(350); 
    }
  });


  $("#nav > li > a").on('click',function(e){
      if($(this).parent().hasClass("has_sub")) {
        e.preventDefault();
      }   

      if(!$(this).hasClass("subdrop")) {
        // hide any open menus and remove all other classes
        $("#nav li ul").slideUp(350);
        $("#nav li a").removeClass("subdrop");
        
        // open our new menu and add the open class
        $(this).next("ul").slideDown(350);
        $(this).addClass("subdrop");
      }
      
      else if($(this).hasClass("subdrop")) {
        $(this).removeClass("subdrop");
        $(this).next("ul").slideUp(350);
      } 
      
  });
});

$(document).ready(function(){
  $(".sidebar-dropdown a").on('click',function(e){
      e.preventDefault();

      if(!$(this).hasClass("open")) {
        // hide any open menus and remove all other classes
        $(".sidebar #nav").slideUp(350);
        $(".sidebar-dropdown a").removeClass("open");
        
        // open our new menu and add the open class
        $(".sidebar #nav").slideDown(350);
        $(this).addClass("open");
      }
      
      else if($(this).hasClass("open")) {
        $(this).removeClass("open");
        $(".sidebar #nav").slideUp(350);
      }
  });

});

/* Contact slider publico  */

$(document).ready(function(){
  $(".cslider-btn").on('click',function(e){
      e.preventDefault();

      if(!$(this).prev().hasClass("open")) {
        $(".cslider").slideDown(300);
        $(".cslider").addClass("open");
        $(this).children("i").removeClass().addClass("icon-angle-up");
      }
      
      else if($(this).prev().hasClass("open")) {
        $(".cslider").removeClass("open");
        $(".cslider").slideUp(300);
        $(this).children("i").removeClass().addClass("icon-angle-down");
      }
  });

});
