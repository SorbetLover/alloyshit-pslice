// isCameraOnForcedPos
import shaders.DropShadowShader;
import shaders.WiggleEffectRuntime;
import shaders.WiggleEffectRuntime.WiggleEffectType;

var shits:Array = [];
var purpleOverlay;
var blackScreen;
var wiggleEffece:WiggleEffect;
function onCreate(){

	blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	blackScreen.alpha = 0;
	blackScreen.scrollFactor.set();
	blackScreen.scale.set(5, 5);
	add(blackScreen);

	for(i in [1,2,3,4]){
		var fbs = new FlxSprite().loadGraphic(Paths.image("stages/scarlet/" + i));
		add(fbs);
		fbs.cameras = [camHUD];
		shits.push(fbs);
		fbs.alpha = 0;	
	}

	applyshit(dad);
	applyshit(boyfriend);
	
	

}

function onCreatePost(){
	wiggleEffece = new WiggleEffectRuntime(1, 2, 0.01, WiggleEffectType.DREAMY);

	game.getLuaObject("bg").shader = wiggleEffece;
	game.getLuaObject("bg").antialiasing = true;
}
function onUpdate(elapsed){
	wiggleEffece?.update(elapsed);
}
function applyshit(obj){
        var name = new DropShadowShader();
		name.setAdjustColor(-10, 10, 20, 0);
		name.color = 0xFF660054;
		name.antialiasAmt = 0;
		name.attachedSprite = obj;
		name.distance = 30;
		name.strength = 1;
        switch(obj.curCharacter){
			case "scarlet":
				name.angle = 60;
			case "casual_fever":
				name.angle = 120;
			default:
				name.angle = 90;
		}
        name.threshold = 0.1;
        obj.shader = name;
        obj.animation.callback = function(anim, frame, index)
        {
            name.updateFrameInfo(obj.frame);
        };
        obj.shader = name;
}
function alphaTween(obj:FlxSprite, from:Float, to:Float, duration:Float = 1){
    obj.alpha = from;
    for(i in 0...obj.length){
		FlxTween.tween(obj[i], {alpha: to}, duration);
	}
}
var ogao:Float = 0;
function onBeatHit(){
	switch(curBeat){
		case 48:
			ogao = strumLineNotes.members[0].alpha;
			for(i in 0...4){
				FlxTween.tween(strumLineNotes.members[i], {alpha: 0}, 1);
				FlxTween.tween(strumLineNotes.members[i + 4], {alpha: 0.6}, 1);
			
			}
			alphaTween([iconP1, iconP2, healthBar, scoreTxt], 1, 0, 1);
			PlayState.instance.cameraSpeed = 0.5;
			// triggerEvent("Camera Follow Pos", camFollow.x, -1200);
			triggerEvent("Camera Follow Pos", camFollow.x, camFollow.y);
			FlxTween.tween(camFollow, {x:camFollow.x + 1, y: camFollow.y - 550}, 0.64 / PlayState.instance.inst.pitch);
			camGame.fade(0xFF000000, 0.58 / PlayState.instance.inst.pitch, false);
		case 50:
			FlxTween.tween(shits[0], {alpha: 1}, 0.7);
		case 59:
			FlxTween.tween(shits[0], {alpha: 0}, 0.7);
		case 62:
			FlxTween.tween(shits[1], {alpha: 1}, 0.7);
		case 71:
			FlxTween.tween(shits[1], {alpha: 0}, 0.7);
		case 75:
			FlxTween.tween(shits[2], {alpha: 1}, 0.7);
		case 83:
			FlxTween.tween(shits[2], {alpha: 0}, 0.7);
		case 87:
			FlxTween.tween(shits[3], {alpha: 1}, 0.7);
		case 94:
			FlxTween.tween(shits[3], {alpha: 0}, 0.7);
		case 96:
			FlxTween.tween(shits[3], {alpha: 0}, 0.7);
			triggerEvent("Camera Follow Pos", null, null);
			camGame.fade(0xFF000000, 0.58, true);

			PlayState.instance.cameraSpeed = 0.7;
			
			for(i in 0...4){
				FlxTween.tween(strumLineNotes.members[i], {alpha: ogao}, 1);
				FlxTween.tween(strumLineNotes.members[i + 4], {alpha: 1}, 1);
			
			}

	}
}