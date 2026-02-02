// Inherit the parent event
event_inherited();

Witnesses = [
    {name: "Ostrit", docs: ["OstritDeathCertificate.pdf"]},
    {name: "Foltest", docs: ["FoltestWitnessStatement.pdf"]},
    {name: "Velerad", docs: ["VeleradWitnessStatement.pdf", "VeleradRecording1.mp3", "VeleradRecording2.mp3"]},
    {name: "Segelin", docs: ["SegelinMageBook.pdf", "SegelinWitnessStatement.pdf"]},
    {name: "Princess", docs: ["PrincessMedicalReport.pdf"]},
    {name: "Geralt", docs: ["GeraltClaimsDocument.pdf", "GeraltHiringContract.pdf"]},
    {name: "Timothy", docs: ["TimothyNote.pdf", "TimothyRecording.mp3"]}
]

AddMessage("> Please enter the name of the document that you wish to send as proof of your decision, regardless of acceptance or denial of Hunter's Claim.\n Press [c_lime]Submit[c_white] when ready. Press [c_lime]'Tab'[c_white] to help Autocomplete!");

Subscribe("AddedDocument", function(docName)
{
    AddMessage("> You have added [c_lime][[" + docName + "][c_white] to the outgoing documents.");
});

Subscribe("InvalidDocument", function(docName)
{
    var splitString = string_split_ext(docName, [ "(", ")", ",", " "], true);
    if (string_lower(string_trim(splitString[0])) == string_lower(string_trim("article")))
    {
        var articleNum = string_trim(splitString[1]);
        var sectionNum = string_trim(splitString[3]);

        if (string_is_numeric(articleNum) && string_is_numeric(sectionNum) && (real(articleNum) >= 1 && real(articleNum) <= 3) && (real(sectionNum) >= 1 && real(sectionNum) <= 3))
        {
            AddMessage("> [c_white]The document name you have entered, [c_red][[" + docName + "][c_white], is not recognized. Please check the spelling and try again. Remember, use the actual document name!\nDid you mean [c_lime][[a" + articleNum + "s" + sectionNum + ".pdf][c_white] instead?");
            return;
        }
    }

    for (var i = 0; i < array_length(splitString); i++)
    {
        for (var j = 0; j < array_length(Witnesses); j++)
        {
            if (string_lower(string_trim(splitString[i])) == string_lower(string_trim(Witnesses[j].name)))
            {
                var docsNames = "";
                for (var k = 0; k < array_length(Witnesses[j].docs); k++)
                {
                    docsNames += "[c_lime][[" + Witnesses[j].docs[k] + "][c_white]";
                    if (k < array_length(Witnesses[j].docs) - 1)
                    {
                        docsNames += ", ";
                    }
                }
                AddMessage($"> [c_white]The document name you have entered, [c_red][[{docName}][c_white], is not recognized. Please check the spelling and try again. Remember, use the actual document name!\nDid you mean {docsNames} instead?");
                return;
            }
        }
    }
    AddMessage("> [c_white]The document name you have entered, [c_red][[" + docName + "][c_white], is not recognized. Please check the spelling and try again. Remember, use the actual document name!");
});

function string_is_numeric(str)
{
    var num = real(str);
    return !is_nan(num);
}