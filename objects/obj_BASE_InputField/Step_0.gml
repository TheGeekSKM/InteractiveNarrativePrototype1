if (keyboard_check(vk_anykey) and string_length(text) < textLimit)
{
    text = string_concat(text, string(keyboard_string));
    keyboard_string = "";
}

if (keyboard_check(vk_backspace) && !keyboard_check_pressed(vk_backspace) && deleteTimer == 2)
{
    text = string_delete(text, string_length(text), 1);
    deleteTimer = 0;
    keyboard_string = "";
}

if (keyboard_check_pressed(vk_backspace))
{
    text = string_delete(text, string_length(text), 1)
    keyboard_string = "";
    deleteTimer = -4;
}
else if (keyboard_check_pressed(vk_backspace) and keyboard_check(vk_control))
{
    text = ""
    keyboard_string = "";
    deleteTimer = -4;
}

if (deleteTimer != 2) deleteTimer++;
    
if (keyboard_check_pressed(vk_enter)) EnterPressed();

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("V")))
{
    var paste = clipboard_get_text();
    if (paste != "")
    {
        var allowed = textCharLimit - string_length(text);
        text += string_copy(paste, 1, allowed);
    }
}

if (keyboard_check_pressed(vk_up))
{
    if (array_length(recentlyEnteredText) == 0) return;
        
    recentlyEnteredTextIndex--;
    if (recentlyEnteredTextIndex < 0) recentlyEnteredTextIndex = 0;
    text = recentlyEnteredText[recentlyEnteredTextIndex];
}
else if (keyboard_check_pressed(vk_down))
{
    if (array_length(recentlyEnteredText) == 0) return;
        
    recentlyEnteredTextIndex++;
    if (recentlyEnteredTextIndex > array_length(recentlyEnteredText) - 1)
    {
        recentlyEnteredTextIndex = array_length(recentlyEnteredText) - 1;
    }
    text = recentlyEnteredText[recentlyEnteredTextIndex];
}

if (keyboard_check(vk_control) && keyboard_check_pressed(ord("A")))
{
    textSelected = true;
}

if (textSelected && (keyboard_check_pressed(vk_backspace) || keyboard_check_pressed(vk_delete)))
{
    text = "";
    textSelected = false;
}
