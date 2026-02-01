// Inherit the parent event
event_inherited();

endingNumber = 7;

endingStruct = SafeReadJson(working_directory + "Ending.json");
if (endingStruct == undefined) endingNumber = 7;
else endingNumber = endingStruct[$ "endingNum"];


switch(endingNumber) {
    case 1:
        AddMessage("[c_yellow][wave]Ending 1 / 7:[/wave][c_white]\nGeralt gets paid, Timothy is fired permanently");
        break;
    case 2:
        AddMessage("[c_yellow][wave]Ending 2 / 7:[/wave][c_white]\nGeralt gets paid, Timothy is fired for citing weird articles");
        break;
    case 3:
        AddMessage("[c_yellow][wave]Ending 3 / 7:[/wave][c_white]\nGeralt gets paid, King gets outed, Timothy becomes King");
        break;
    case 4:
        AddMessage("[c_yellow][wave]Ending 4 / 7:[/wave][c_white]\nGeralt goes to jail, Timothy is hired permanently");
        break;
    case 5:
        AddMessage("[c_yellow][wave]Ending 5 / 7:[/wave][c_white]\nGeralt goes to jail, King is Outed, Timothy becomes King");
        break;
    case 6:
        AddMessage("[c_yellow][wave]Ending 6 / 7:[/wave][c_white]\nGeralt goes to jail, Timothy is fired");
        break;
    default:
        AddMessage("[c_yellow][wave]Ending 7 / 7:[/wave][c_white]\nTimothy is Fired, Case Moves to Another Manager");
        break;
}