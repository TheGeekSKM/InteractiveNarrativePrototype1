function OpenFolder(fName)
{
    var escapedFolder = string_replace_all(fName, "\"", "\\\"");
    if (os_type == os_windows) execute_shell("cmd", "explorer \"" + escapedFolder + "\"");
    else if (os_type = os_macosx) execute_shell("open", "\"" + escapedFolder + "\"");
    else if (os_type = os_linux) execute_shell("xdg-open", "\"" + escapedFolder + "\"");
}