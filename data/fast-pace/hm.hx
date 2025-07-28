
import objects.BGSprite;
import shaders.DropShadowShader;
import objects.Character;
var otherAbby:Character;

function onCreate(){}
function onCreatePost(){
    // FlxG.camera.zoom = 0.4;
    boyfriend.y -= 80;
    otherAbby = new Character(0,0, "abbymad", false);
    // add(otherAbby);
    otherAbby.x = dad.x - 10;
    otherAbby.y = dad.y - 10;
    otherAbby.visible = false;
    insert(members.indexOf(dad) + 4, otherAbby);
    // debugPrint(otherAbby);
    otherAbby.debugMode = false;
    applyshit(otherAbby);
}
function onUpdate(elapsed:Float){}

function onBeatHit(){
    if(curBeat % 4 == 0 && dad.getAnimationName() == "idle"){
        // otherAbby.dance();
        otherAbby.playAnim("idle", true);
    }
}
function onUpdatePost(){
    if(dad.getAnimationName() == "idle" && otherAbby.debugMode == true){
        otherAbby.debugMode = false;
        // otherAbby.dance();
        otherAbby.playAnim("idle", true);
    }
}
function opponentNoteHitPre(note){
    switch(note.noteType){
        case "altChar":
            otherAbby.visible = true;
            dad.visible = false;
        default:
            otherAbby.visible = false;
            dad.visible = true;
    }
    otherAbby.debugMode = true; 
    switch(note.noteData){
        case 0:
            otherAbby.playAnim("singLEFT", true);
        case 1:
            otherAbby.playAnim("singDOWN", true);
        case 2:
            otherAbby.playAnim("singUP", true);
        case 3:
            otherAbby.playAnim("singRIGHT", true);
    }
}

function applyshit(obj){
        var shadr = new DropShadowShader();
		shadr.setAdjustColor(-66, -10, 24, -23);
		shadr.color = 0xFF52351d;
		shadr.antialiasAmt = 0;
		shadr.attachedSprite = obj;
		shadr.distance = 20;
        
        shadr.angle = 90;
        shadr.threshold = 0.1;
        obj.shader = shadr;
        obj.animation.callback = function(anim, frame, index)
        {
            shadr.updateFrameInfo(obj.frame);
        };
        obj.shader = shadr;
        
}