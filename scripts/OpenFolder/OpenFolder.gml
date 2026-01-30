function OpenFolder(fName)
{
    var escapedFolder = string_replace_all(fName, "\"", "\\\"");
    if (os_type == os_windows) execute_shell("cmd", "explorer \"" + escapedFolder + "\"");
    else if (os_type = os_macosx) execute_shell("open", "\"" + escapedFolder + "\"");
    else if (os_type = os_linux) execute_shell("xdg-open", "\"" + escapedFolder + "\"");
}

function OpenFile(fileName)
{
    var escapedFileName = string_replace_all(fileName, "\"", "\\\"");
    if (os_type == os_windows) execute_shell("cmd", "start \"\" \"" + escapedFileName + "\"");
    else if (os_type = os_macosx) execute_shell("open", "\"" + escapedFileName + "\"");
    else if (os_type = os_linux) execute_shell("xdg-open", "\"" + escapedFileName + "\"");
}