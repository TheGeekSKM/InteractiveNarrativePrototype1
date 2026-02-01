// Inherit the parent event
event_inherited();

Witnesses = [
    "Ostrit",
    "Foltest",
    "Velerad",
    "Segelin",
    "Princess",
    "Geralt",
    "Timothy"
]

// Add message to textBox
// process request
function ProcessText(_textInputArray) 
{
    Raise("TextEntered", text);
    var foundArticle = CheckArticles(_textInputArray);
    if (foundArticle) return;

    var foundWitness = CheckWitnesses(_textInputArray);
    if (foundWitness) return;

    var foundRandom = CheckRandom(_textInputArray);
    if (foundRandom) return;

    Raise("InvalidRequest", {});    
}

function CheckRandom(_textInputArray)
{
    // Check for "random"
    var hiIndex = array_get_index(_textInputArray, "hi");
    var helloIndex = array_get_index(_textInputArray, "hello");
    if (hiIndex != -1 || helloIndex != -1)
    {
        Raise("HiRequest", {});
        return true;
    }

    var helpIndex = array_get_index(_textInputArray, "help");
    if (helpIndex != -1)
    {
        Raise("HelpRequest", {});
        return true;
    }

    return false;
}

function CheckWitnesses(_textInputArray)
{
    // Check for witness names
    for (var i = 0; i < array_length(Witnesses); i++)
    {
        var witnessName = Witnesses[i];
        var nameIndex = array_get_index(_textInputArray, string_lower(witnessName));
        if (nameIndex != -1)
        {
            // Found Witness Name
            Raise("WitnessRequest", {
                witness: witnessName
            });

            OpenFolder($"witnesses\\{string_lower(witnessName)}")
            return true;
        }
    }
    return false;
}

function CheckArticles(_textInputArray)
{
    // Check for Article # Section #
    var _articleIndex = array_get_index(_textInputArray, "article");
    var _sectionIndex = array_get_index(_textInputArray, "section");
    if (_articleIndex != -1 && _sectionIndex != -1)
    {
        var _articleNum = -1;
        var _sectionNum = -1;
        
        if (_articleIndex + 1 < array_length(_textInputArray))
        {
            _articleNum = real(_textInputArray[_articleIndex + 1]);
            if (_articleNum > 3 || _articleNum < 1) _articleNum = -1;
        }
        if (_sectionIndex + 1 < array_length(_textInputArray))
        {
            _sectionNum = real(_textInputArray[_sectionIndex + 1]);
            if (_sectionNum > 3 || _sectionNum < 1) _sectionNum = -1;
        }
        
        if (_articleNum != -1 && _sectionNum != -1)
        {
            // Valid Request
            Raise("DocRequest", {
                article: _articleNum,
                section: _sectionNum
            });

            OpenFile($"articles\\a{_articleNum}s{_sectionNum}.pdf");
            return true;
        }
    }

    // Check for A # S # format
    var _aIndex = array_get_index(_textInputArray, "a");
    var _sIndex = array_get_index(_textInputArray, "s");

    if (_aIndex != -1 && _sIndex != -1)
    {
        var _articleNum = -1;
        var _sectionNum = -1;
        
        if (_aIndex + 1 < array_length(_textInputArray))
        {
            _articleNum = real(_textInputArray[_aIndex + 1]);
            if (_articleNum > 3 || _articleNum < 1) _articleNum = -1;
        }
        if (_sIndex + 1 < array_length(_textInputArray))
        {
            _sectionNum = real(_textInputArray[_sIndex + 1]);
            if (_sectionNum > 3 || _sectionNum < 1) _sectionNum = -1;
        }
        
        if (_articleNum != -1 && _sectionNum != -1)
        {
            // Valid Request
            Raise("DocRequest", {
                article: _articleNum,
                section: _sectionNum
            });

            OpenFile($"articles\\a{_articleNum}s{_sectionNum}.pdf");
            return true;
        }
    }

    // Invalid Request
    return false;
}
