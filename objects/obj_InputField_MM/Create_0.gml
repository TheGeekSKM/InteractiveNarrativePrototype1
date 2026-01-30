// Inherit the parent event
event_inherited();


function ProcessText(_textInputArray)
{
    if (array_length(_textInputArray) > 0)
    {
        Transition(rmGame, seqTrans_In_CornerSlide, seqTrans_Out_CornerSlide);
    }
}


