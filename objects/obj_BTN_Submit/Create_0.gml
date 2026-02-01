function IsMouseOver()
{
    var topLeftX = x - sprite_width / 2;
    var topLeftY = y - sprite_height / 2;
    return point_in_rectangle(mouse_x, mouse_y, topLeftX, topLeftY, topLeftX + sprite_width, topLeftY + sprite_height);
}

clicked = false;


currentColor = c_white;