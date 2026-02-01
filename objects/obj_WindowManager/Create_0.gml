#macro INTERNAL_WIDTH 800
#macro INTERNAL_HEIGHT 448

global.WindowManager = id;
global.GAME_INSTANCE_MIN = 1;
global.saveLocation = working_directory;
if (!directory_exists(global.saveLocation))
{
    directory_create(global.saveLocation);
}

OpenFolder(global.saveLocation)

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
else if (global.GAME_INSTANCE_ID == 1)
{
    window_set_caption("MiniScript LookingGlass - Email Client");
    window_set_position(random_range(0, display_get_width() - window_get_width()), random_range(0, display_get_height() - window_get_height()));
    room_goto(rmEmail);
    UpdateScale(INTERNAL_WIDTH, INTERNAL_HEIGHT, true);
}
else if (global.GAME_INSTANCE_ID == 2)
{
    window_set_caption("MiniScript LookingGlass - Doc Request Client");
    window_set_position(random_range(0, display_get_width() - window_get_width()), random_range(0, display_get_height() - window_get_height()));
    room_goto(rmDocRequest);
    UpdateScale(INTERNAL_WIDTH, INTERNAL_HEIGHT, true);
}
else if (global.GAME_INSTANCE_ID == 3)
{
    window_set_caption("MiniScript LookingGlass - Document Viewer");
    window_set_position(random_range(0, display_get_width() - window_get_width()), random_range(0, display_get_height() - window_get_height()));
    room_goto(rmEnding);
    UpdateScale(INTERNAL_WIDTH, INTERNAL_HEIGHT, true);
}

function GameEnd()
{
    //if game instance has child
    if (global.GAME_INSTANCE_ID == 0) { // if parent process
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_1 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_1)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_1) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_2 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_2)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_2) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_3 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_3)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_3) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_4 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_4)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_4) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_5 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_5)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_5) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_6 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_6)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_6) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_7 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_7)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_7) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }
        
        // global.CHILD_PROCESS_ID == 0 if not successfully executed and CompletionStatusFromExecutedProcess() == true if child is dead
        if (global.CHILD_PROCESS_ID_8 != 0 && !CompletionStatusFromExecutedProcess(global.CHILD_PROCESS_ID_8)) 
        {
        
            // tell grandchild process the child process is going to die so grandchild can also die (see step event)
            var fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_8) + ".tmp";
            var fd = file_text_open_write(fname);
            if (fd != -1) 
            {
                file_text_write_string(fd, "GAME_PROCESS_DIED");
                file_text_writeln(fd);
                file_text_close(fd);
            } 
            else 
            {
                show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
            }
        }   
    }
    
    // if game instance has parent
    else if (global.GAME_INSTANCE_ID > global.GAME_INSTANCE_MIN - 1) 
    { 
        // if child process
        var fname = global.saveLocation + "/proc/" + string(ProcIdFromSelf()) + ".tmp";
        var fd = file_text_open_write(fname);
        if (fd != -1) 
        {
            file_text_write_string(fd, "CHILD_PROCESS_DIED");
            file_text_writeln(fd);
            file_text_close(fd);
        } 
        else 
        {
            show_error("ERROR: failed to open file for writing!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
        }
    }
}