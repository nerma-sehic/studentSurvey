// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery
//= require jquery-1.11.1
//= require jquery-ui-1.11.1
//= require jquery-1.10.3.custom.min
//= require jquery.multi-select
//= require bootstrap-colorpicker
//= require bootstrap
//= require bootstrap-min
//= require bootstrap-filestyle
//= require bootstrap-multiselect
//= require jquery.multiselect
//= require jquery.multiselect.filter
//= require jquery.blockUI.js
//= require select2.min
//= require checkbox.min
//= require selectize
//= require multiselect
//= require clockpicker
//= require tipso
//= require imagepreview
//= require dropzone
//= require htScript
//= require_self



if (typeof jQuery !== 'undefined') {
	(function($) {
		$('#spinner').ajaxStart(function() {
			$(this).fadeIn();
		}).ajaxStop(function() {
			$(this).fadeOut();
		});
	})(jQuery);
}
