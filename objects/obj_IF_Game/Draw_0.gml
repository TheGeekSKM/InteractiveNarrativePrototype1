if (!GUI)
{
    var str = stickVisible ? $"M:\\Users\\Timothy > {text}|" : $"M:\\Users\\Timothy > {text}";
    draw_self();
    if (textSelected)
    {
        scribble(str)
            .align(fa_left, fa_middle)
            .starting_format("Monogram", c_aqua)
            .transform(1, 1, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
    else 
    {
        scribble(str)
            .align(fa_left, fa_middle)
            .starting_format("Monogram", c_white)
            .transform(1, 1, image_angle)
            .draw(x - (sprite_width / 2) + 5, y);
    }
}