function CreateNewWindow(_id)
{
    //if (global.GAME_INSTANCE_ID != 0 && _id != 7 && _id != 8) return false; // Only allow parent to create
    
    // Prevent duplicate launch
    switch (_id) {
        case 1:
            if (global.CHILD_PROCESS_ID_1 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(1)); // Force instance ID
            global.CHILD_PROCESS_ID_1 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;

        case 2:
            if (global.CHILD_PROCESS_ID_2 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(2));
            global.CHILD_PROCESS_ID_2 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;

        case 3:
            //if (global.CHILD_PROCESS_ID_3 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(3));
            global.CHILD_PROCESS_ID_3 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;
        
        case 4:
            if (global.CHILD_PROCESS_ID_4 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(4));
            global.CHILD_PROCESS_ID_4 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;
        
        case 5:
            if (global.CHILD_PROCESS_ID_5 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(5));
            global.CHILD_PROCESS_ID_5 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;
        
        case 6:
            if (global.CHILD_PROCESS_ID_6 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(6));
            global.CHILD_PROCESS_ID_6 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;
        
        case 7:
            if (global.CHILD_PROCESS_ID_7 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(7));
            global.CHILD_PROCESS_ID_7 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;

        case 8:
            if (global.CHILD_PROCESS_ID_8 != 0) return false;
            EnvironmentSetVariable("GAME_INSTANCE_ID", string(8));
            global.CHILD_PROCESS_ID_8 = ExecProcessFromArgVAsync(GetArgVFromProcid(ProcIdFromSelf()));
            break;
}

    // Reset the GAME_INSTANCE_ID so future spawns default to 0 + 1 logic again
    EnvironmentSetVariable("GAME_INSTANCE_ID", string(global.GAME_INSTANCE_ID));
    return true;
}

function GetArgVFromProcid(proc_id) {
  var kinfo_proc, kinfo_argv;
  kinfo_proc = ProcInfoFromProcIdEx(proc_id, KINFO_EXEP | KINFO_ARGV);
  kinfo_argv[0] = ExecutableImageFilePath(kinfo_proc);
  if (CommandLineLength(kinfo_proc) >= 2) {
      for (var i = 1; i < CommandLineLength(kinfo_proc); i++) {
      kinfo_argv[i] = CommandLine(kinfo_proc, i);
      }
  }
  FreeProcInfo(kinfo_proc);
  return kinfo_argv;
}

function ExecProcessFromArgVAsync(kinfo_argv) {
    var cmdline = "";
    for (var i = 0; i < array_length(kinfo_argv); i++) {
        var tmp = string_replace_all(kinfo_argv[i], "\\", "\\\\");
        tmp = "\"" + string_replace_all(tmp, "\"", "\\\"") + "\"";
        if (i < array_length(kinfo_argv) - 1) tmp += " ";
        cmdline += tmp;
    }
    return ProcessExecuteAsync(cmdline);
}

/// @description Read and write JSON data to/from files safely
/// @param {string} filePath - The path to the file.
/// @param {string} jsonString - The JSON string to write to the file.
function SafeWriteJson(filePath, jsonString)
{
    var tempPath = filePath + ".tmp";

    var file = file_text_open_write(tempPath);
    if (file != -1)
    {
        file_text_write_string(file, jsonString);
        file_text_close(file);

        if (file_exists(tempPath))
        {
            file_delete(filePath); 
            file_rename(tempPath, filePath); 
        }
    }
    else
    {
        show_error("Failed to open file for writing: " + tempPath, true);
    }
}

/// @description Read JSON data from a file safely
/// @param {string} filePath - The path to the file.
/// @returns {object} - The parsed JSON object or undefined if the file doesn't exist or parsing fails.
function SafeReadJson(_path)
{
    if (!file_exists(_path)) {
        return undefined;
    }

    var jsonString = "";
    var file = file_text_open_read(_path);

    while (!file_text_eof(file)) {
        jsonString += file_text_read_string(file);
        file_text_readln(file);
    }

    file_text_close(file);


    // Prevent parse errors by checking if it's empty or corrupted
    if (string_length(jsonString) == 0) {
        show_debug_message("SafeReadJson: JSON string is empty!");
        return undefined;
    }

    var parsedData;

    try {
        parsedData = json_parse(jsonString);
    } catch(e) {
        show_debug_message("SafeReadJson: JSON parse error - " + e.message);
        return undefined;
    }

    return parsedData;
}

