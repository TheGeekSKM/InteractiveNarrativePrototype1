if (!GUI)
{
    var str = stickVisible ? $"{preString}{text}|" : $"{preString}{text}";
    draw_self();
    if (textSelected)
    {
        scribble(str)
            .align(fa_left, fa_top)
            .starting_format("Monogram", c_aqua)
            .transform(1, 1, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
    else 
    {
        scribble(str)
            .align(fa_left, fa_top)
            .starting_format("Monogram", c_white)
            .transform(1, 1, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
}