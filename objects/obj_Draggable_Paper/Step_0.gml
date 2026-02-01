// Inherit the parent event
event_inherited();
if (mouse_check_button_released(mb_left)) dragging = false;

///

if (dragging)
{
    x = guiMouseX - xOffset;
    y = guiMouseY - yOffset;
}

var rotation = mouse_wheel_down() - mouse_wheel_up();
if (rotation != 0 && dragging)
{
    image_angle += rotation * 5;
}
