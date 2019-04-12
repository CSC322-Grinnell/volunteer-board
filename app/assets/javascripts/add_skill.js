/* global $ */

$(document).ready(function() {
    console.log("Add Skill script is loaded.");
    
    $('#volunteerSkill').keypress(function(e){
        if(e.keyCode==13) {
            e.preventDefault();
            $('#add-skill-btn').click();
        }
    });
    
    $('#add-skill-btn').on('click', function () {
        var text = $("#volunteerSkill").val();
        createTag(text);
        document.getElementById("volunteerSkill").value = "";
    });
    
    $('#addedSkills').on('click', 'button', function () {
        console.log("Hey");
        $(this).parent().remove();
    });
    
    function createTag(text) {
        var close_btn = document.createElement("button");
        close_btn.type = "button";
        close_btn.className = "btn close-btn";
        close_btn.innerHTML = "x";
        
        var div = document.createElement("span");
        div.className = "badge";
        div.style.margin = "2px";
        div.style.background = "#337ab7";
        div.innerHTML = text;
        
        div.appendChild(close_btn);
        
        document.getElementById("addedSkills").appendChild(div);
    }
});