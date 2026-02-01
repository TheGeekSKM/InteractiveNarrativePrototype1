topLeftX = x - (sprite_width / 2);;
topLeftY = y - (sprite_height / 2);

if (point_in_rectangle(guiMouseX, guiMouseY, topLeftX, topLeftY, topLeftX + displayWidth, topLeftY + displayHeight))
{
    var scrollDir = mouse_wheel_up() - mouse_wheel_down();
    var scrollStep = 32;
    targetScrollOffset -= scrollDir * scrollStep;
}

var contentHeight = __getTotalLineHeight() + ((array_length(messageList) - 1) * padding);

var maxScroll = max(0, contentHeight - displayHeight);
targetScrollOffset = clamp(targetScrollOffset, 0, maxScroll);

scrollOffset = clamp(scrollOffset, 0, maxScroll);
scrollOffset = lerp(scrollOffset, targetScrollOffset, scrollSpeed);

atTop = (scrollOffset <= 1);
atBottom = (abs(targetScrollOffset - maxScroll) <= 1);