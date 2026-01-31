global.emailManager = id;

DoesUnreadEmailExist = true;



inbox = [];

function AddEmail(_email) {
    array_push(inbox, _email);
    DoesUnreadEmailExist = true;
    Raise("OnNewEmailReceived", id);
}
