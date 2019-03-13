/* global $ */
/* global action */
/* global Clipboard */

$(document).ready(function() {
    console.log("Hello the script is loaded.");
    
    $('#clipboard-btn').on('click', function () {
        var textFieldToBeCopied = $("#volunteerEmails");
        copyToClipboard(textFieldToBeCopied);
    });

    function copyToClipboard(textFieldToBeCopied) {
        textFieldToBeCopied.select();

        try {
            var successful = document.execCommand('copy');
            var msg = successful ? 'successful' : 'unsuccessful';
            console.log('Copying text command was ' + msg);
        } catch (err) {
            console.log('Oops, unable to copy');
        }
    }
});