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

}); // DOCUMENT ready


// Callback for TURBOLINKS loaded
document.addEventListener("turbolinks:load", function() {

  if (document.querySelector('#search')){
    var placesAutocomplete = places({
      appId: 'plC8UYAMHK2J',
      apiKey: '1269f51d6f6aceff6a532f29caa6fdb0',
      container: document.querySelector('#search')
    });
  }
})
