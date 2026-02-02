email = new Email(
    "margaret@royalmail.com",
    "How to Work with Me",
    @"Hi dearie,

    I'm Margaret, your new assistant. I am definitely a real person and not a composite of several Magic Scrolls meant to mimic human interaction...
    
[c_yellow]Here's some info on how to communicate with me:[c_white]
1. The [c_lime]Codex of Magis Regiis[c_white] has 9 Laws -> 3 Articles and 3 Sections per Article. If you want to read one of them, just type in [wave]'Article X Section Y'[/wave] (e.g., 'Article 2 Section 1') in the Docu_Request.exe.
    
2. There are several witnesses involved in this Claim. Just tell me their [wave]name[/wave] (e.g. 'Segelin') and I'll give you their statements and info.
    
    [slant]Note:[/slant] Please don't ask me too many things. I am definitely 'grouchy' and absolutely not costing a tremendous amount of royal funds and mana to maintain resulting in the crash of the kingdom's economy as my engineers promise upgrades and improvements that never come to fruition.
    
[c_grey]End of Token Input[c_white]"
);

function IsMouseOver()
{
    var topLeftX = x - sprite_width / 2;
    var topLeftY = y - sprite_height / 2;
    return point_in_rectangle(mouse_x, mouse_y, topLeftX, topLeftY, topLeftX + sprite_width, topLeftY + sprite_height);
}

clicked = false;
Subscribe("OnDisplayEmail", function(_email) 
{
    if (_email.subject == email.subject) clicked = true;
    else clicked = false;
});

currentColor = c_white;