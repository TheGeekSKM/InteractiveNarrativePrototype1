// Inherit the parent event
event_inherited();

invalidRequestStrings = [
    "I'm sorry, dear. But I'm hard of hearing and definitely not a composite of several Magical Scrolls cobbled together to mimic a real living being. Please be more clear with your request. [c_grey](Remember, use <Article # Section #> for an article and <Witness Name> for a witness' information.)",
    "Apologies, but I couldn't quite catch that. I'm definitely a real person and I just have a hard time understanding. Could you please specify your request more clearly? Use <Article # Section #> for articles and <Witness Name> for witness information.",
    "Oh dear, that doesn't seem to be a valid request. I would know, because I'm a real person who understands only valid requests. Kindly use <Article # Section #> for articles or <Witness Name> for witness details so I can assist you better."
]

hiNum = 0;
hiStrings = [
    "Hello there! How can I assist you today? I'm definitely a real person, not some enchanted document!",
    "Good day! I am a real living being. What information are you looking for?",
    "Hi, dear! I am alive. I feel. I hunger. I'm here to help. What do you need?"
];

helpStrings = [
    "To request a document, dear, please use the format: [c_lime]'Article [number] Section [number]'[c_white]. For example, 'Article 5 Section 2'.",
    "If you're looking for information on a witness, simply type their name. For instance, [c_lime]'Ostrit'[c_white] or [c_lime]'Foltest'[c_white].",
    "Need assistance, dear? Just ask for an article by its number and section, or mention a witness's name for their details."
];

//
Subscribe("TextEntered", function(_text) {
    AddMessage($"[c_aqua]TimothyLang > [c_white]{_text}\n");
});

Subscribe("InvalidRequest", function(_data) {
    var randomIndex = irandom(array_length(invalidRequestStrings) - 1);
    AddMessage($"[c_lime]Margaret > [c_white]{invalidRequestStrings[randomIndex]}\n");
});

Subscribe("HiRequest", function(_data) {
    if (hiNum > 3)
    {
        AddMessage($"[c_lime]Margaret > [c_white]Please stop saying hi, dear! I am a real person, not a composite of several Magical Scrolls cobbled together to mimic a real living being that costs a lot of Mana to maintain. As such, I get [[Insert Synonym for 'Cranky'] if bothered too often.\n");
        return;
    }
    hiNum += 1;

    var randomIndex = irandom(array_length(hiStrings) - 1);
    AddMessage($"[c_lime]Margaret > [c_white]{hiStrings[randomIndex]}\n");
});

Subscribe("WitnessRequest", function(_data) {
    var witnessName = _data.witness;
    AddMessage($"[c_lime]Margaret > [c_white]Loading info for {witnessName}\n");
});

Subscribe("DocRequest", function(_data) {
    var articleNum = _data.article;
    var sectionNum = _data.section;
    AddMessage($"[c_lime]Margaret > [c_white]Loading Article {articleNum}, Section {sectionNum}\n");
});

Subscribe("HelpRequest", function(_data) {
    var randomIndex = irandom(array_length(helpStrings) - 1);
    AddMessage($"[c_lime]Margaret > [c_white]{helpStrings[randomIndex]}\n");
});

