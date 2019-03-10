/* global $ */
/* global Clipboard */

var wait;

$(document).ready(function() {
    var clipboard = new Clipboard('.clipboard-btn');
    console.log(clipboard);
    
    $(".send-email-btn").click(function() {
        clearTimeout(wait)
        $(this).html("Success!");
        wait = setTimeout(function(){ 
            $(".send-email-btn").html("Send email");
        }, 2000);
    });
});