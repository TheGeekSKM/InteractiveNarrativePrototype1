if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left))
{
    currentIndex--;
    if (currentIndex < 0) currentIndex = 4;
    Raise("OnGameSelectionChanged", currentIndex);
}
else if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right))
{
    currentIndex++;
    if (currentIndex > 4) currentIndex = 0;
    Raise("OnGameSelectionChanged", currentIndex);
}


if (keyboard_check_pressed(vk_enter))
{
}