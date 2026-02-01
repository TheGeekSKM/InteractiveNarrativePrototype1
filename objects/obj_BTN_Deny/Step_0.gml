if (mouse_check_button_released(mb_left) && IsMouseOver())
{
    if (clicked) return;
    
    clicked = true;
    Raise("OnClickedOption", false);
}

if (clicked) currentColor = c_yellow;
else if (IsMouseOver()) currentColor = c_red;
else currentColor = c_maroon;
    
image_blend = currentColor;