draw_self();

topLeftX = x - (sprite_width / 2);
topLeftY = y - (sprite_height / 2);

scribble(email.subject)
    .align(fa_center, fa_middle)
    .starting_format("Monogram", c_white)
    .transform(1.2, 1.2, image_angle)
    .wrap(sprite_width - 40)
    .draw(x, y);
