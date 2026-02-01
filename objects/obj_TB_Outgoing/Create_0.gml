// Inherit the parent event
event_inherited();

AddMessage("> Please enter the name of the document that you wish to send as proof of your decision, regardless of acceptance or denial of Hunter's Claim.\n Press Submit when ready.");

Subscribe("AddedDocument", function(docName)
{
    AddMessage("> You have added [c_lime][[" + docName + "][c_white] to the outgoing documents.");
});