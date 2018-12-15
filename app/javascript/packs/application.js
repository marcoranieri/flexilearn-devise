/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

import $ from 'jquery';
import places from 'places.js';
import "../plugins/flatpickr"

console.log('Hello World from Webpacker')


// Everything's a CALLBACK when document is ready
$( document ).ready(function() {

  // var placesAutocomplete = places({
  //   appId: 'plC8UYAMHK2J',
  //   apiKey: '1269f51d6f6aceff6a532f29caa6fdb0',
  //   container: document.querySelector('#search')
  // });

}); // /DOCUMENT ready


// Callback for TURBOLINKS loaded
document.addEventListener("turbolinks:load", function() {

// placesAutocomplete /////////////////////////////////////////////
  if (document.querySelector('#search')){
    var placesAutocomplete = places({
      appId: 'plC8UYAMHK2J',
      apiKey: '1269f51d6f6aceff6a532f29caa6fdb0',
      container: document.querySelector('#search')
    });
  }

  function clearNotice(){
    $(".notice").animate({opacity:'0'}, 1500);
  }

  var ready = function() {
     setTimeout(clearNotice, 1000);  //Flash fade
  };

///////////////////////////////////////////////////////////////////


// Prevent Android keyboard to push Content up
// https://stackoverflow.com/questions/23757345/android-does-not-correctly-scroll-on-input-focus-if-not-body-element

//   if(/Android [4-6]/.test(navigator.appVersion)) {
//     window.addEventListener("resize", function() {

//       if(document.activeElement.tagName=="INPUT" || document.activeElement.tagName=="TEXTAREA") {
//         window.setTimeout(function() {
//         //console.log("Resizing");
// document.querySelector(".form-actions").style.position = "relative";
// document.querySelector(".form-actions").style.top      = "-40px";

// document.querySelector("#new_student").style.position  = "relative";
// document.querySelector("#new_student").style.top       = "20px";

// document.querySelector(".form-white-btn").style.minHeight = "50px";

//         //document.activeElement.scrollIntoView();
//         },10);
//       }
//     })
//   }

// NO autocomplete (form suggestion)
  if(/Android/.test(navigator.appVersion)){
    $('input[type="text"]').attr('autocomplete', "off");
    $('input[type="email"]').attr('autocomplete', "off");
  }


// Auto FadeOut notice
  $(document).ready( function() {
    $('.alert') .delay(2500).fadeOut();
    $('.notice').delay(2500).fadeOut();
  });


}) /////// END - document.addEventListener("turbolinks:load", function() {
