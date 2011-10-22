// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.tokeninput
//= require_self
//= require_tree .

$(function() {
  $("input.outlet").tokenInput("/outlets.json", {
    theme: "facebook",
    tokenLimit: 1
  });

  $("input.reporter").tokenInput("/reporters.json", {
    theme: "facebook",
    tokenLimit: 1
  });

  $("input.tags").tokenInput("/tags.json", {
    theme: "facebook",
    preventDuplicates: true
  });
  
  $("input.chapter").tokenInput("/chapters.json", {
    theme: "facebook",
    tokenLimit: 1
  });
  
  $("input.reported_on").datepicker({
    
  });
});