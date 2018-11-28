import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import "flatpickr/dist/themes/material_blue.css" // Note this is important!

console.log("flat.js - file is loaded");

window.onload = function(e){
  console.log("flat.js - window content is loaded");

  // Calendar in Lesson#NEW
  flatpickr(".datepicker", {
    minDate: "today",
    disableMobile: true
  });

  // Calendar in Student#EDIT profile
  flatpickr(".datepicker-student-edit", {
    disableMobile: true
  });
}
