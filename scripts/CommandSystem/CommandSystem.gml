/// Command System
/// @description A struct representing a command in the command system
/// @param {string} _keyword The keyword that triggers the command
/// @param {real} _paramCount The number of parameters the command expects
/// @param {array} _callbackArray An array of callback functions to execute when the command
function Command(_keyword, _paramCount, _callbackArray) constructor 
{
    self.keyword = _keyword;
    self.paramCount = _paramCount;
    self.callbackArray = _callbackArray;

    /// Calls all callbacks associated with this command
    /// @param {Array} _passedInParamArray The array containing parameters for the command
    function Call(_passedInParamArray)
    {
        for (var i = 0; i < array_length(self.callbackArray); i += 1) 
        {
            if (self.callbackArray[i] != undefined) 
            {
                self.callbackArray[i](_passedInParamArray);
            }
        }
    }

    enum InvalidCommandError
    {
        DOES_NOT_EXIST = -1,
        INVALID_PARAM_COUNT = -2
    }
}

function CommandLibrary() constructor 
{
    function AddCommand(_keyword, _paramCount, _callbackArray)
    {
        var command = new Command(_keyword, _paramCount, _callbackArray);
        if (self[$ _keyword] == undefined)
        {
            self[$ _keyword] = command;
        }
        else
        {
            // Command already exists, handle as needed (e.g., overwrite or ignore)
        }
    }

    function ValidateCommand(_keyword, _paramArray)
    {
        var command = self[$ _keyword];
        if (command == undefined) return [InvalidCommandError.DOES_NOT_EXIST, undefined];
        else if (command.paramCount != array_length(_paramArray)) return [InvalidCommandError.INVALID_PARAM_COUNT, command.paramCount];
        else return [0, command];
    }

    function RunCommand(_commandKeyword, _commandParamArray)
    {
        var command = ValidateCommand(_commandKeyword, _commandParamArray);
        if (command[0] == 0)
        {
            command[1].Call(_commandParamArray);
            return true;
        }
        else return false;
    }
}