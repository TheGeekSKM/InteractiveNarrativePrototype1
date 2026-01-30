displayWidth = sprite_width;
displayHeight = sprite_height;
padding = 5;
font = "Monogram";
textColor = c_white;

topLeftX = 0;
topLeftY = 0;

messageList = [];
lineHeights = [];
scrollOffset = 0;
targetScrollOffset = 0;
scrollSpeed = 0.2;

atBottom = false;
atTop = false;

textTransform = 0.6;
cursorPos = 0;

function __getTotalLineHeight()
{
    var result = 0;
    for (var i = 0; i < array_length(lineHeights); i++)
    {
        result += lineHeights[i];
    }

    return result;
}

function AddMessage(_message)
{
    _message = string_trim(_message);
    array_push(messageList, _message);

    var scrib = scribble(_message)
        .align(fa_left, fa_top)
        .starting_format(font)
        .transform(textTransform, textTransform, image_angle)
        .wrap(sprite_width / textTransform);

    var h = scrib.get_height() * textTransform;
    array_push(lineHeights, h);

    var total = __getTotalLineHeight() + ((array_length(messageList) - 1) * padding);
    targetScrollOffset = max(0, total - displayHeight);
}

function ClearBox()
{
    messageList = [];
    lineHeights = [];
    scrollOffset = 0;
    targetScrollOffset = 0;
    scrollSpeed = 0.2;
}