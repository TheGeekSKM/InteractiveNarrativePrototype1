// Inherit the parent event
event_inherited();

AddMessage("> Please enter the name of the document that you wish to send as proof of your decision, regardless of acceptance or denial of Hunter's Claim.\n Press Submit when ready. Press 'Tab' to help Autocomplete!");

Subscribe("AddedDocument", function(docName)
{
    AddMessage("> You have added [c_lime][[" + docName + "][c_white] to the outgoing documents.");
});

Subscribe("InvalidDocument", function(docName)
{
    AddMessage("> [c_red]The document name you have entered, [[" + docName + "][c_red], is not recognized. Please check the spelling and try again. Remember, use the actual document name!");
});