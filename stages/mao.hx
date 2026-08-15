import Type;
import shaders.DropShadowShader;
function onCreate(){}

function onCreatePost(){
	// dad.color = 0x112c3585;
	dad.colorTransform.blueMultiplier = 1;
	dad.colorTransform.redMultiplier = 0.7;
	dad.colorTransform.greenMultiplier = 0.7;
	boyfriend.colorTransform.blueMultiplier = 1;
	boyfriend.colorTransform.redMultiplier = 0.7;
	boyfriend.colorTransform.greenMultiplier = 0.7;
	applyshit(dad);
	applyshit(boyfriend);
}
function applyshit(obj){
	if(!ClientPrefs.data.shaders) return;
	if(Type.resolveClass(DropShadowShader) == null) return;

        var shadr = new DropShadowShader();
		shadr.setAdjustColor(0, 0, 0, 0);
		// shadr.setAdjustColor(-66, -10, 24, -23);
		shadr.color = 0xFF5565fa;
		shadr.antialiasAmt = 0;
		shadr.attachedSprite = obj;
		shadr.distance = 30;
		// shadr.strength = 1.1;
        
        shadr.angle = 120;
        shadr.threshold = 0.1;
        obj.shader = shadr;
        obj.animation.callback = function(anim, frame, index)
        {
            shadr.updateFrameInfo(obj.frame);
        };
        obj.shader = shadr;
        
}