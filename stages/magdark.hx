
import objects.BGSprite;
if(ClientPrefs.vibrating != null){ 
    import shaders.DropShadowShader;
}
function onCreate(){
	applyshit(dad);
	applyshit(boyfriend);
    
}
var forcedzoom = 0;
function onCreatePost(){
    if(PlayState.instance.curSong != "its-complicated"){
        game.getLuaObject("monika").visible = false;
        game.getLuaObject("yuri").visible = false;
        game.getLuaObject("natsuki").visible = false;

        game.getLuaObject("crowd").y += 130;
        game.getLuaObject("crowd").scale.set(1,1);
        for(i in [dad, boyfriend]){
            i.y += 50;
        }
        dad.x += 100;
        boyfriend.x -= 100;
    }
    debugPrint( ((FlxG.width - 1280) / 2) / 10);
    // defaultCamZoom = defaultCamZoom - ((FlxG.width - 1280) / 2) / 500 - 0.2;
    // FlxG.camera.zoom = defaultCamZoom;
    forcedzoom = defaultCamZoom;
}
function applyshit(obj){
        if(ClientPrefs.vibrating == null) return;

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
    if(curBeat % 8 == 0){
        camGame.zoom += 0.01;
        camHUD.zoom += 0.01;
    }
}

function onUpdatePost(){
    ///// STUPID CAM ZOOM SHIT
    debugUnbindCameraZoom = true;
    camZooming = false;
    camGame.zoom = FlxMath.lerp(camGame.zoom, forcedzoom, 0.06 * playbackRate);
    camHUD.zoom = FlxMath.lerp(camHUD.zoom, 1, 0.06 * playbackRate);

}
