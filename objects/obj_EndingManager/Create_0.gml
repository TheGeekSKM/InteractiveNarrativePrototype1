endingNumber = 7;

endingStruct = SafeReadJson(working_directory + "Ending.json");
if (endingStruct == undefined) endingNumber = 7;
else endingNumber = endingStruct[$ "endingNum"];

switch (endingNumber) {
    case 1:
        obj_Draggable_Paper.sprite_index = Ending1_Paper;
        obj_Draggable_Note.sprite_index = Ending1_Note;
        break;
    case 2:
        obj_Draggable_Paper.sprite_index = Ending2_Paper;
        obj_Draggable_Note.sprite_index = Ending2_Note;
        break;
    case 3:
        obj_Draggable_Paper.sprite_index = Ending3_Paper;
        obj_Draggable_Note.visible = false;
        break;
    case 4:
        obj_Draggable_Paper.sprite_index = Ending4_Paper;
        obj_Draggable_Note.visible = false;
        break;
    case 5:
        obj_Draggable_Paper.sprite_index = Ending5_Paper;
        obj_Draggable_Note.visible = false;
        break;
    case 6:
        obj_Draggable_Paper.sprite_index = Ending6_Paper;
        obj_Draggable_Note.sprite_index = Ending6_Note;
        break;
    default:
        obj_Draggable_Paper.sprite_index = Ending7_Paper;
        obj_Draggable_Note.sprite_index = Ending7_Note;
        break;
}