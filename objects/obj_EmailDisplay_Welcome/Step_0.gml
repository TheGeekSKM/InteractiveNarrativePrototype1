if (IsMouseOver() && mouse_check_button(mb_left))
{
    image_blend = c_lime;
}
else if (IsMouseOver() && mouse_check_button_released(mb_left))
{
    image_blend = c_yellow;
    Raise("OnDisplayEmail", email);
}
else
{
    image_blend = c_white;
}