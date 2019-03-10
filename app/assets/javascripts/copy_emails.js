/* global $ */
/* global Clipboard */

var wait;

$(document).ready(function() {
    var clipboard = new Clipboard('.clipboard-btn');
    console.log(clipboard);
    
    $(".send-email-btn").click(function() {
        clearTimeout(wait);
        var green_color = $(this).css("background-color");
        $(this).html("Success!").css("background-color", "lime");
        wait = setTimeout(function(){ 
            $(".send-email-btn").html("Send email").css("background-color", green_color);
        }, 2000);
    });
});