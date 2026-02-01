draw_self();

// var yy = topLeftY - scrollOffset;
// var lineX = topLeftX + 5;

// for (var i = 0; i < array_length(messageList); i += 1) 
// {
//     var line = messageList[i];
//     var scrib = scribble(line)
//         .align(fa_left, fa_top)
//         .starting_format(font)
//         .transform(textTransform, textTransform, image_angle)
//         .wrap(sprite_width / textTransform);
    
//     scrib.draw(lineX, yy);

//     yy += lineHeights[i] + padding;
// }

var surf_w = sprite_width - 2;
var surf_h = sprite_height - 2;

if (!surface_exists(clipSurface)) {
    clipSurface = surface_create(surf_w, surf_h);
}

surface_set_target(clipSurface);
draw_clear_alpha(c_black, 0); 

var yy = 0 - scrollOffset; 
var lineX = 5; // Fixed padding inside the box

for (var i = 0; i < array_length(messageList); i += 1) 
{
    var line = messageList[i];

    var scrib = scribble(line)
        .align(fa_left, fa_top)
        .starting_format(font)
        .transform(textTransform, textTransform, image_angle)
        .wrap(surf_w / textTransform);
    
    // Only draw if it's potentially visible to save performance
    if (yy + lineHeights[i] > 0 && yy < surf_h) {
        scrib.draw(lineX, yy);
    }

    yy += lineHeights[i] + padding;
}
surface_reset_target();

draw_surface(clipSurface, topLeftX, topLeftY);

if (!atTop) draw_sprite_ext(spr_upDown, 0, x + (sprite_width / 2) - 5, y - (sprite_height / 2) + 5 + sprite_get_height(spr_upDown), 1, 1, 0, c_white, 1);
if (!atBottom) draw_sprite_ext(spr_upDown, 1, x + (sprite_width / 2) - 5, y + (sprite_height / 2) - 5, 1, 1, 0, c_white, 1);