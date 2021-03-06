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
//= require modernizer-2.0.6
//= require_self
//= require_tree .

$(function() {
  // $("input.outlet").tokenInput("/media_outlets.json", {
  //   theme: "facebook",
  //   tokenLimit: 1,
  //   minChars: 0
  // });

  // $("input.reporter").tokenInput("/reporters.json", {
  //   theme: "facebook",
  //   tokenLimit: 1,
  //   minChars: 0
  // });

  // $("input.tags").tokenInput("/tags.json", {
  //   theme: "facebook",
  //   preventDuplicates: true
  // });

  // $("input.chapter").tokenInput("/chapters.json", {
  //   theme: "facebook",
  //   tokenLimit: 1,
  //   minChars: 0
  // });
  //
  // $("input.press_release").tokenInput("/press_releases.json", {
  //   theme: "facebook",
  //   tokenLimit: 1,
  //   propertyToSearch: "title",
  //   minChars: 0
  // });

  $(".reported_on input, .released_on input, input.start_on, input.end_on, .datetime").datepicker({
    dateFormat: 'yy-mm-dd'
  });

  $("nav .media .new").click(function() {
    $(this).parents(".media").first().find(".new-menu").toggle();
    return false;
  });
  $(".new-menu").hide();

  $(document).click(function() {
    $(".new-menu").hide();
  });
});