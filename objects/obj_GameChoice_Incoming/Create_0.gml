backgroundSequence = layer_sequence_create("GUI", x, y, seq_GameChoice_Incoming);
layer_sequence_pause(backgroundSequence);


selected = false;

Subscribe("OnGameSelectionChanged", function(_data) {
    if (_data == IDValue)
    {
        layer_sequence_headdir(backgroundSequence, seqdir_right);
        layer_sequence_play(backgroundSequence);
        selected = true;
    }
    else 
    {
        if (!selected) return;
        layer_sequence_headdir(backgroundSequence, seqdir_left);
        layer_sequence_play(backgroundSequence);   
        selected = false;
    }
});
