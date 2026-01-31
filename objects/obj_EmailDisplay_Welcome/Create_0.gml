email = new Email(
    "velerad@royalmail.com",
    "Welcome, New Employee!",
    @"Salutations, my good friend.

    It is I, Minister Velerad, writing to you on behalf of His Royal Majesty, Kind Foltest the Third. The King and his Mages are quite impressed with your application to join the Claims Committee. You are tasked with the serious responsibility of reviewing claims made by Hunters regarding the various supernatural phenomena that they have killed.
    
    Now I must warn you to be quite careful. You see, most Hunters are not exactly the most... trustworthy of individuals. Many Hunters have been known to exaggerate or fabricate claims in order to receive greater rewards from the Crown. It will be your duty to sift through these claims and determine which are legitimate and which are not. Failure to do so could result in dire consequences for the Kingdom.

[[c_yellow]YOU WILL DO THE FOLLOWING:[c_white]
1. Review the claim thoroughly and objectively. [c_grey](You will find the claim in the [wave]Incoming_Files[/wave] folder.)[c_white]

2. Verify the claim by cross-referencing it with evidence from both the Codex of Magis Regiis and Witness Testimonies. [c_grey](Both can be requested in the [wave]Docu_Request.exe[/wave] application.)[c_white]

3. Use the [wave]Outgoing_Doc.exe[/wave] application to draft your decision on the claim. [c_red](You must provide a reference to the Article and Section number in the Codex as citation.)[c_white]

Remember, the fate of the Kingdom rests in your hands. Do not take this responsibility lightly."
);

function IsMouseOver()
{
    var topLeftX = x - sprite_width / 2;
    var topLeftY = y - sprite_height / 2;
    return point_in_rectangle(mouse_x, mouse_y, topLeftX, topLeftY, topLeftX + sprite_width, topLeftY + sprite_height);
}