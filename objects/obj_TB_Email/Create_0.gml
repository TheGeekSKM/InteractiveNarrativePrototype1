// Inherit the parent event
event_inherited();

email = undefined;

Subscribe("OnDisplayEmail", function(_email) 
{
    email = _email;
    ClearBox();
    AddMessage($"From: {email.sender},\nSubject: {email.subject}\n\n{email.content}");
});