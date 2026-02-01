if (global.GAME_INSTANCE_ID == 0)
{
    // Check the child process tmp files for death signals and set their IDs to 0
    fname = global.saveLocation + "proc/" + string(ProcIdFromSelf()) + ".tmp";
    if (file_exists(fname)) 
    {
        var fd = file_text_open_read(fname);
        if (fd != -1) 
        {
            var str = file_text_read_string(fd);
            file_text_readln(fd);
            file_text_close(fd);
            if (str == "CHILD_PROCESS_DIED") 
            {
                game_end();
            }
        } 
        else 
        {
            show_error("ERROR: Failed to open file for reading!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
        }
    }

    fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_1) + ".tmp";
    if (file_exists(fname)) 
    {
        var fd = file_text_open_read(fname);
        if (fd != -1) 
        {
            var str = file_text_read_string(fd);
            file_text_readln(fd);
            file_text_close(fd);
            if (str == "CHILD_PROCESS_DIED") 
            {
                global.CHILD_PROCESS_ID_1 = 0;
                echo("child1_Killed")
            }
        } 
        else 
        {
            show_error("ERROR: Failed to open file for reading!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
        }
    }

    fname = global.saveLocation + "proc/" + string(global.CHILD_PROCESS_ID_2) + ".tmp";
    if (file_exists(fname)) 
    {
        var fd = file_text_open_read(fname);
        if (fd != -1) 
        {
            var str = file_text_read_string(fd);
            file_text_readln(fd);
            file_text_close(fd);
            if (str == "CHILD_PROCESS_DIED") 
            {
                global.CHILD_PROCESS_ID_2 = 0;
                echo("child2_Killed")
            }
        } 
        else 
        {
            show_error("ERROR: Failed to open file for reading!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
        }
    }
}
else 
{
    // if child process
    var fname = global.saveLocation + "proc/" + string(ProcIdFromSelf()) + ".tmp";
    if (file_exists(fname)) 
    {
        var fd = file_text_open_read(fname);
        if (fd != -1) 
        {
            var str = file_text_read_string(fd);
            file_text_readln(fd);
            file_text_close(fd);
            if (str == "GAME_PROCESS_DIED") 
            {
                game_end();
            }
        } 
        else 
        {
            show_error("ERROR: Failed to open file for reading!\n\nERROR DETAILS: Too many file descriptors opened by the current process or insufficient priviledges to access file!", true);
        }
    }
}