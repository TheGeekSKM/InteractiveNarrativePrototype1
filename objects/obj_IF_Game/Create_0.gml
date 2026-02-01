// Inherit the parent event
event_inherited();

commandLibrary = new CommandLibrary();

commandLibrary.AddCommand("cd", 1, [function(_arg) {
    if (_arg[0] != undefined && string_lower(_arg[0]) == "incoming_files") {
        echo("OPEN INCOMING FILES FOLDER");
        OpenFolder(working_directory + "Incoming_Files");
    }
}]);

commandLibrary.AddCommand("start", 1, [function(_arg) {
    if (_arg[0] == undefined) return;
    
    switch (string_lower(_arg[0]))
    {
        case "email.exe":
            echo("Open Email");
            ResetPreString();
            CreateNewWindow(1);
            break;
        case "docu_request.exe":
            echo("Open Document Request");
            CreateNewWindow(2);
            break;
        case "notepad.txt":
            echo("Open Notepad");
            OpenFile("Notepad.txt");
            break;
        case "outbound_doc.exe":
            echo("Open Outbound Document");
            CreateNewWindow(3);
            break;
    }
}]);

commandLibrary.AddCommand("exit", 0, [function(_arg) {
    game_end();
}]);

function ProcessText(_textInputArray) 
{
    var keyword = _textInputArray[0];
    
    var commandParamArray = [];
    for (var i = 1; i < array_length(_textInputArray); i += 1) {
        array_push(commandParamArray, _textInputArray[i]);
    }
    
    var couldRun = commandLibrary.RunCommand(keyword, commandParamArray);
    if (couldRun) text = "";
}


function AttemptAutoComplete()
{
    if (text == "" || text == undefined)
    {
        return;
    }

    var textSplit = string_split_ext(text, [ "(", ")", ",", " "], true);
    //get the last word
    var lastWord = textSplit[array_length(textSplit) - 1];

    var autocorrected = false;

    if (!autocorrected)
    {
        // loop through commands in the local command library
        var localCommandList = struct_get_names(commandLibrary);
        var localCommandListLength = array_length(localCommandList);

        for (var i = 0; i < localCommandListLength; i += 1) 
        {
            if (string_starts_with(string_lower(localCommandList[i]),  string_lower(lastWord)))
            {
                lastWord = localCommandList[i];
                autocorrected = true;
                break;
            }
        }
    }

    if (!autocorrected)
    {
        var optionsArray = ["Incoming_Files", "Email.exe", "Docu_Request.exe", "Notepad.txt", "Outbound_Doc.exe"];
        var optionsArrayLength = array_length(optionsArray);

        for (var i = 0; i < optionsArrayLength; i += 1) 
        {
            if (string_starts_with(string_lower(optionsArray[i]),  string_lower(lastWord)))
            {
                lastWord = optionsArray[i];
                autocorrected = true;
                break;
            }
        }
    }


    if (autocorrected)
    {
        var finalString = "";
        for (var i = 0; i < array_length(textSplit); i += 1) 
        {
            if (i == array_length(textSplit) - 1)
            {
                finalString += string_concat(" ", lastWord);
            }
            else
            {
                finalString += string_concat(" ", textSplit[i]);
            }
        }

        text = string_trim(finalString);
    }
}

preString = @"MiniScript LookingGlass <Version 10.0.22631.6199>
(c) 2024 LookingGlass Interactive. All rights reserved.

M:\Users\TimothyLang > dir
  Volume in drive M is LookingGlass
  Volume Serial Number is 1234-5678

  Directory of M:\Users\TimothyLang

  Date        Time        Type           Name
  ----------  --------    -----          -----------------
  06/10/1024  10:00 AM    <DIR>          Incoming_Files
  10/15/1023  02:30 PM    <FIL>          Email.exe [c_red]<UNREAD>[c_white]
  11/20/1023  11:15 AM    <FIL>          Docu_Request.exe
  12/05/1023  09:45 AM    <FIL>          Notepad.exe
  01/12/1024  03:20 PM    <FIL>          Outbound_Doc.exe

            4 File(s)      1,280,000 bytes
            1 Dir(s)  100,000,000,000 bytes free

  Use [c_green]'start <file_name>'[c_white] to open a file.
  Use [c_green]'cd <folder_name>'[c_white] to change directory.

M:\Users\TimothyLang > "

function ResetPreString()
{
    preString = @"MiniScript LookingGlass <Version 10.0.22631.6199>
(c) 2024 LookingGlass Interactive. All rights reserved.

M:\Users\TimothyLang > dir
  Volume in drive M is LookingGlass
  Volume Serial Number is 1234-5678

  Directory of M:\Users\TimothyLang

  Date        Time        Type           Name
  ----------  --------    -----          -----------------
  06/10/1024  10:00 AM    <DIR>          Incoming_Files
  10/15/1023  02:30 PM    <FIL>          Email.exe
  11/20/1023  11:15 AM    <FIL>          Docu_Request.exe
  12/05/1023  09:45 AM    <FIL>          Notepad.exe
  01/12/1024  03:20 PM    <FIL>          Outbound_Doc.exe

            4 File(s)      1,280,000 bytes
            1 Dir(s)  100,000,000,000 bytes free

  Use [c_green]'start <file_name>'[c_white] to open a file.
  Use [c_green]'cd <folder_name>'[c_white] to change directory.

M:\Users\TimothyLang > ";
}

Subscribe("OnNewEmailReceived", function(_recieved) {
    if (variable_global_exists("emailManager") && global.emailManager.DoesUnreadEmailExist)
    {
        preString = @"MiniScript LookingGlass <Version 10.0.22631.6199>
(c) 2024 LookingGlass Interactive. All rights reserved.

M:\Users\TimothyLang > dir
  Volume in drive M is LookingGlass
  Volume Serial Number is 1234-5678

  Directory of M:\Users\TimothyLang

  Date        Time        Type           Name
  ----------  --------    -----          -----------------
  06/10/1024  10:00 AM    <DIR>          Incoming_Files
  10/15/1023  02:30 PM    <FIL>          Email.exe [c_red]<UNREAD>[c_white]
  11/20/1023  11:15 AM    <FIL>          Docu_Request.exe
  12/05/1023  09:45 AM    <FIL>          Notepad.exe
  01/12/1024  03:20 PM    <FIL>          Outbound_Doc.exe

            4 File(s)      1,280,000 bytes
            1 Dir(s)  100,000,000,000 bytes free

  Use [c_green]'start <file_name>'[c_white] to open a file.
  Use [c_green]'cd <folder_name>'[c_white] to change directory.
        
M:\Users\TimothyLang > ";
    }
})