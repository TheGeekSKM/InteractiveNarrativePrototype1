#macro INTERNAL_WIDTH 800
#macro INTERNAL_HEIGHT 448

global.WindowManager = id;
global.GAME_INSTANCE_MIN = 1;
global.saveLocation = working_directory + "/saves/";

global.GAME_INSTANCE_MAX = 20;
global.CHILD_PROCESS_ID_1 = 0;
global.CHILD_PROCESS_ID_2 = 0;
global.CHILD_PROCESS_ID_3 = 0;
global.CHILD_PROCESS_ID_4 = 0;
global.CHILD_PROCESS_ID_5 = 0;
global.CHILD_PROCESS_ID_6 = 0;
global.CHILD_PROCESS_ID_7 = 0;
global.CHILD_PROCESS_ID_8 = 0;

global.GAME_INSTANCE_ID = int64(bool(EnvironmentGetVariableExists("GAME_INSTANCE_ID")) ? EnvironmentGetVariable("GAME_INSTANCE_ID") : string(0));
EnvironmentSetVariable("GAME_INSTANCE_ID", string(global.GAME_INSTANCE_ID + 1));

if (global.GAME_INSTANCE_ID == 0)
{
    // Ensure save directory exists
    var dName = global.saveLocation + "proc/";
    if (directory_exists(dName)) directory_destroy(dName);
    directory_create(dName);

    UpdateScale(INTERNAL_WIDTH, INTERNAL_HEIGHT, true);
}

function GameEnd()
{
    if (global.GAME_INSTANCE_ID == 0)
    {
        // TODO: Close out the child processes
    }
    else if (global.GAME_INSTANCE_ID > global.GAME_INSTANCE_MIN - 1)
    {
        var fName = global.saveLocation + "proc/" + string(ProcIdFromSelf()) + ".tmp";
        var file = file_text_open_write(fName);
        if (file != -1)
        {
            file_text_write_string(file, "CHILD_PROCESS_DIED");
            file_text_writeln(file);
            file_text_close(file);
        }
        else
        {
            show_error("Failed to write process death file: " + fName, true);
        }
    }
}