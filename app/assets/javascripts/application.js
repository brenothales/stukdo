// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery.color
//= require twitter/bootstrap
//= require html.sortable
//= require turbolinks
//= require_tree .


// script do botão adicionar as tasks
$('.fab').hover(function () {
    $(this).toggleClass('active');
});
$(function () {
  $('[data-toggle="tooltip"]').tooltip()
})
// fim

// abrir e fechar dos postits 
$(document).on('click', '.postit-heading span.clickable', function(e){
    var $this = $(this);
	if(!$this.hasClass('panel-collapsed')) {
		$this.parents('.panel-postit').find('.postit-body').slideUp();
		$this.addClass('panel-collapsed');
		$this.find('i').removeClass('fa fa-chevron-up').addClass('fa fa-chevron-down');
	} else {
		$this.parents('.panel-postit').find('.postit-body').slideDown();
		$this.removeClass('panel-collapsed');
		$this.find('i').removeClass('fa fa-chevron-down').addClass('fa fa-chevron-up');
	}
})
//fim  abrir e fechar dos postits 