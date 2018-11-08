import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import "flatpickr/dist/themes/material_blue.css" // Note this is important!

console.log("file is loaded")

window.onload = function(e){
  console.log("window content is loaded")
  flatpickr(".datepicker", {})
}
