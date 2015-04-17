# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$('#myTab a[href="#profile"]').tab 'show'
# Select tab by name
$('#myTab a:first').tab 'show'
# Select first tab
$('#myTab a:last').tab 'show'
# Select last tab
$('#myTab li:eq(2) a').tab 'show'