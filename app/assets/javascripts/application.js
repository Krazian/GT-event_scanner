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
//
//= require jquery
//= require jquery-ui
//= require tether
//= require bootstrap
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function formatDateTime(dateTime){
	return new Date(dateTime).toLocaleDateString("en-us",{year: "numeric", month: "short",day: "numeric", hour: "2-digit", minute: "2-digit", second: "2-digit", timeZone:"UTC", timeZoneName:"short"});
}