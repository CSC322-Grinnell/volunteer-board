/* global $ */

$(document).ready(function() {
    console.log("Add Skill script is loaded.");
    
    //when enter key is pressed, add skill item into list of tags 
    //(same as button click below)
    $('#volunteerSkill').keypress(function(e){
        if(e.keyCode==13) {
            e.preventDefault();
            $('#add-skill-btn').click();
        }
    });
    
    //when clicked, add skill item into the list of tags
    $('#add-skill-btn').on('click', function () {
        var text = $("#volunteerSkill").val();
        createTag(text);
        document.getElementById("volunteerSkill").value = "";
    });
    
    //when clicking on the close button, remove the tag from the list
    $('#addedSkills').on('click', 'button', function () {
        $(this).parent().remove();
    });
    
    //add popular skills into the list of tags
    $('#popularSkills').on('click', 'button', function () {
        var text = $(this).parent().contents().get(0).nodeValue;
        createTag(text);
    });
    
    //save button writes the skill tags onto the registration page
    $("#save-skill-btn").on('click', function() {
        var skill_arr = [];
        $("#addedSkills").children().each(function() {
            skill_arr.push($(this).contents().get(0).nodeValue.trim());
        });
        document.getElementById("user_skills").value = skill_arr.join(", ");
        $("#skillModal").modal("hide");
    });
    
    //helper function to create a tag with given text in the AddSkills section
    function createTag(text) {
        if (text === "") return;
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