# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.css-code').each ->
    myCodeMirror = CodeMirror.fromTextArea(this,
      mode:
        name: "css"
      lineNumbers: true
      matchBrackets: true
      matchTags: true
      theme: "monokai"
  	  )