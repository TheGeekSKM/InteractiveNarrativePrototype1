// Inherit the parent event
event_inherited();

//

DocumentNames = [
    "a1s1.pdf",
    "a1s2.pdf",
    "a1s3.pdf",
    "a2s1.pdf",
    "a2s2.pdf",
    "a2s3.pdf",
    "a3s1.pdf",
    "a3s2.pdf",
    "a3s3.pdf",
    "AddaBirthCertificate.pdf",
    "AddaMedicalReport.pdf",
    "FoltestWitnessStatement.pdf",
    "GeraltClaimsDocument.pdf",
    "GeraltHiringContract.pdf",
    "OstritDeathCertificate.pdf",
    "OstritMedicalReport.pdf",
    "SegelinMageBook.pdf",
    "SegelinWitnessStatement.pdf",
    "TimothyNote.pdf",
    "TimothyRecording.mp3",
    "VeleradRecording1.mp3",
    "VeleradRecording2.mp3",
    "VeleradWitnessStatement.pdf",
]

accept = false;
usedDocuments = [];
Subscribe("OnClickedOption", function(_bool) 
{
    accept = _bool;
});
Subscribe("OnSubmit", function(_id) {
    ProcessEnding();
})

function AttemptAutoComplete()
{
    if (text == "" || text == undefined)
    {
        return;
    }

    var textSplit = string_split_ext(text, [ "(", ")", ",", " "], true);
    //get the last word
    var lastWord = textSplit[array_length(textSplit) - 1];

    var autocorrected = false;

    if (!autocorrected)
    {
        var optionsArray = DocumentNames;
        var optionsArrayLength = array_length(optionsArray);

        for (var i = 0; i < optionsArrayLength; i += 1) 
        {
            if (string_starts_with(string_lower(optionsArray[i]),  string_lower(lastWord)))
            {
                lastWord = optionsArray[i];
                autocorrected = true;
                break;
            }
        }
    }


    if (autocorrected)
    {
        var finalString = "";
        for (var i = 0; i < array_length(textSplit); i += 1) 
        {
            if (i == array_length(textSplit) - 1)
            {
                finalString += string_concat(" ", lastWord);
            }
            else
            {
                finalString += string_concat(" ", textSplit[i]);
            }
        }

        text = string_trim(finalString);
    }
}

function ProcessText(_textInputArray) 
{
    for (var i = 0; i < array_length(_textInputArray); i += 1) 
    {
        for (var j = 0; j < array_length(DocumentNames); j += 1) 
        {
            if (string_lower(_textInputArray[i]) == string_lower(DocumentNames[j])) 
            {
                Raise("AddedDocument", DocumentNames[j]);
                array_push(usedDocuments, DocumentNames[j]);
                return;
            }
        }
    }
}

function ProcessEnding() {
    // 1. Accept + Article 2 Section 1 -> Geralt Gets Money, Timothy is Fired
    // 2. Accept + Article 1 Section 1 -> Geralt Gets Paid, Timothy Fired for Citing Weird Articles
    // 3. Accept + Article 1 Section 1 + Timothy Recording -> Geralt Gets Paid, King Gets Outed, Timothy Fired
    // 4. Deny + Ostrit Death Certificate + Medical Report -> Geralt Gets Arrested, Timothy is Hired Permanently
    // 5. Deny + Article 1 Section 1 + Timothy Recording -> Geralt Gets Arrested, King Gets Outed, Timothy is Made Into King
    // 6. Deny + No Documents -> Geralt Gets No Money, Timothy Fired
    // 7. Anything else -> Timothy is Fired, Cases Moves to Another Manager
}