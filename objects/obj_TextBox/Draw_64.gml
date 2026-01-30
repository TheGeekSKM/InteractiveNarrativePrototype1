draw_self();

var yy = topLeftY - scrollOffset;
var lineX = topLeftX + 5;

for (var i = 0; i < array_length(messageList); i += 1) 
{
    var line = messageList[i];
    var scrib = scribble(line)
        .align(fa_left, fa_top)
        .starting_format(font)
        .transform(textTransform, textTransform, image_angle)
        .wrap(sprite_width / textTransform);
    
    scrib.draw(lineX, yy);

    yy += lineHeights[i] + padding;
}