if (GUI)
{
    var str = stickVisible ? $"> {text}|" : $"> {text}";
    draw_self();
    if (textSelected)
    {
        scribble(str)
            .align(fa_left, fa_middle)
            .starting_format("Monogram", c_aqua)
            .transform(2, 2, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
    else 
    {
        scribble(str)
            .align(fa_left, fa_middle)
            .starting_format("Monogram", c_white)
            .transform(2, 2, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
}