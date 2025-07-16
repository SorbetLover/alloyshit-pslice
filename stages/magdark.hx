
import objects.BGSprite;
import shaders.DropShadowShader;

function onCreate(){
	applyshit(dad);
	applyshit(boyfriend);
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
function onBeatHit(){
    if(curBeat % 2 == 0){
        game.getLuaObject("monika").playAnim("idle", true);
        game.getLuaObject("yuri").playAnim("idle", true);
        game.getLuaObject("crowd").playAnim("idle", true);
        game.getLuaObject("natsuki").playAnim("idle", true);


    }
}