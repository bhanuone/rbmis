// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require semantic_ui/semantic_ui
//= require jquery.datetimepicker
//= require jquery.tokenize
//= require cloudinary
//= require turbolinks

var enableDropdown = function() {
  $('.ui.dropdown, .dropdown.icon')
    .dropdown({
      on: 'hover'
    })
  ;
};

var enableAccordion = function() {
  $('.ui.accordion')
    .accordion()
  ;
};

var closeFlash = function() {
  $('.message .close').on('click', function() {
    $(this).closest('.message').fadeOut();
  });
};


$(document).ready(function(){
  $('.field_with_errors').closest('.field').addClass('error');
});

$(document).on('ready page:load', function() {
  enableDropdown();
  closeFlash();
  enableAccordion();
})
