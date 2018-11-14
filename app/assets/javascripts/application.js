// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks

// Auto close flash message
function autoCloseFlash() {
  if ($('.alert').length > 0) {
    setTimeout(function() {
      $(".alert").fadeTo(500, 0, function() {
        $(this).remove()
      });
    }, 3000);
  }
}

// Auto scroll flash message
function autoPositionFlash() {
  if ($('.alert').length > 0) {
    positionFlash();

    scrollPositionFlash();
  }
}

function scrollPositionFlash() {
  $(window).on('scroll', function() {
    positionFlash();
  });
}

function positionFlash() {
  if ($('.xhr-alert').length > 0) {
    scrollTop = $(window).scrollTop() + 56;
    $('.alert').css("top", scrollTop + 'px');
  } else {
    scrollTop = $(window).scrollTop() + 9;
    $('.alert').css("top", scrollTop + 'px');
  }
}

$(document).on('turbolinks:load', function() {
  autoPositionFlash();
  autoCloseFlash();
});
