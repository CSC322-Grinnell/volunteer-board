/* global $ */
/* global Clipboard */

$(document).ready(function() {
    var clipboard = new Clipboard('.clipboard-btn');
    console.log(clipboard);
    $("[send-email]").on("click", function(){
        console.log("Hey I am sending an email.");
        $(this).html("Success!");
    });
});