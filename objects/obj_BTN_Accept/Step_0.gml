if (mouse_check_button_released(mb_left) && IsMouseOver())
{
    if (clicked) return;
    
    clicked = true;
    Raise("OnClickedOption", true);
}

if (clicked) currentColor = c_yellow;
else if (IsMouseOver()) currentColor = c_lime;
else currentColor = c_green;
    
image_blend = currentColor;