event_inherited();

dragging = false;
xOffset = 0;
yOffset = 0;

topLeftX = 0;
topLeftY = 0;

topRightX = 0;
topRightY = 0;

function OnMouseLeftClick() {
    dragging = true;
    xOffset = guiMouseX - x;
    yOffset = guiMouseY - y;
    return;
}

function OnMouseLeftClickRelease()
{
    dragging = false;
}