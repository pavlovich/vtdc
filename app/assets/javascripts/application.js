// This file is included in all sites and subsites.  This is a
// manifest file that'll be compiled into including all the files
// listed below.  Add new JavaScript/Coffee code in separate files in
// the application directory and they'll automatically be included.
// It's not advisable to add code directly here, but if you do, it'll
// appear at the bottom of the the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require jquery.rest.js
//= require ckeditor/init
//= require_tree ./application
//= require calendar.js
//= require fullcalendar.js
//= require gcal.js
//= require jquery-ui-sliderAccess.js
//= require jquery-ui-timepicker-addon.js
//= require image.js

$.ajaxSetup({
    beforeSend: function(xhr) {
        xhr.setRequestHeader("Accept", "text/javascript");
    }
});
