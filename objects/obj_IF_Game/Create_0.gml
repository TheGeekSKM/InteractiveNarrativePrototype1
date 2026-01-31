// Inherit the parent event
event_inherited();

commandLibrary = new CommandLibrary();

commandLibrary.AddCommand("cd", 1, [function(_arg) {
    if (_arg[0] != undefined && string_lower(_arg[0]) == "incoming_files") {
        echo("OPEN INCOMING FILES FOLDER");
    }
}]);

commandLibrary.AddCommand("start", 1, [function(_arg) {
    if (_arg[0] == undefined) return;
    
    switch (string_lower(_arg[0]))
    {
        case "email.exe":
            echo("Open Email");
            break;
        case "docu_request.exe":
            echo("Open Document Request");
            break;
        case "notepad.exe":
            echo("Open Notepad");
            break;
        case "outbound_doc.exe":
            echo("Open Outbound Document");
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
        var optionsArray = ["Incoming_Files", "Email.exe", "Docu_Request.exe", "Notepad.exe", "Outbound_Doc.exe"];
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
