deleteTimer = 2;
text = "";
textLimit = TextCharLimit;
textSelected = false;

recentlyEnteredText = [];
recentlyEnteredTextIndex = -1;

stickVisible = true;
alarm[0] = 30;

function EnterPressed()
{
    if (text != "" && text != undefined)
    {
        array_push(recentlyEnteredText, text);
        recentlyEnteredTextIndex = array_length(recentlyEnteredText);
        echo(recentlyEnteredText);
        
        var lowerText = string_lower(string_trim(text));

        var textSplit = string_split_ext(lowerText, [ "(", ")", ",", " ", "!", "?", "'"], true);
        
        ProcessText(textSplit);
        text = "";
    }
}

function ProcessText(_textInputArray) {}

function AttemptAutoComplete()
{
    echo("TODO: Implement Autocomplete");
}