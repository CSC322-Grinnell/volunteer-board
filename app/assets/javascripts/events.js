/* global $ */
/* global Clipboard */

$(document).ready(function() {
    var clipboard = new Clipboard('.copy-btn');
    console.log(clipboard);
});