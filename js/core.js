/*
The core javascript for asp.net - Team Sergio
Handles a default javascript events
@author: Peter Nagy
*/

//The menu hover function
$(document).ready(function () {
    $("ul.top li").hover(function () {
        $(this).children("ul.subsub").slideDown('fast');
    }, function () {
        $(this).children("ul.subsub").slideUp('slow');
    });
});
