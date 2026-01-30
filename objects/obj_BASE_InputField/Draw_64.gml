if (GUI)
{
    draw_self();
    if (textSelected)
    {
        scribble($"> {text}")
            .align(fa_left, fa_middle)
            .starting_format("Monogram", c_aqua)
            .transform(1, 1, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
    else 
    {
        scribble($"> {text}")
            .align(fa_left, fa_middle)
            .starting_format("Monogram", c_white)
            .transform(1, 1, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
}