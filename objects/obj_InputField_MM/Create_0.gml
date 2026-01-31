// Inherit the parent event
event_inherited();


function ProcessText(_textInputArray)
{
    if (array_length(_textInputArray) > 0)
    {
        room_goto_next();
    }
}


