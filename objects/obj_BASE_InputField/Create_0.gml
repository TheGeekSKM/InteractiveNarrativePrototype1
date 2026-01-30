deleteTimer = 2;
text = "";
textLimit = TextCharLimit;
textSelected = false;

recentlyEnteredText = [];
recentlyEnteredTextIndex = -1;

function EnterPressed()
{
    if (text != "" && text != undefined)
    {
        array_push(recentlyEnteredText, text);
        recentlyEnteredTextIndex = array_length(recentlyEnteredText);
        echo(recentlyEnteredText);
        
        text = string_lower(string_trim(text));
        var textSplit = string_split_ext(text, [ "(", ")", ",", " "], true);
    }
}

function AttemptAutoComplete()
{
    echo("TODO: Implement Autocomplete");
}