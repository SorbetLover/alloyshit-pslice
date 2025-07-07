import objects.BGSprite;
import shaders.DropShadowShader;
import flixel.addons.display.FlxBackdrop;

var bgSky:BGSprite;
var foliage:BGSprite;
var bgSchool:BGSprite;
var bgStreet:BGSprite;
var fgTrees:BGSprite;
var bgTrees:BGSprite;
var treeLeaves:BGSprite;

var skything:FlxBackdrop;
var school:Array = [];
var monka:Array = [];
var dshader:DropShadowShader;
var bfshader:DropShadowShader;
function onCreate(){
    school.push(game.getLuaObject("sky"));
    school.push(game.getLuaObject("school"));
    school.push(game.getLuaObject("street"));
    
    monka.push(game.getLuaObject("room"));
    monka.push(game.getLuaObject("table"));

    // monka[0].alpha = 0;
    // monka[1].alpha = 0;
    game.getLuaObject("evil").alpha = 0;

    applyshit(dad, dshader);
    applyshit(boyfriend, bfshader);
    
    skything = new FlxBackdrop().loadGraphic(Paths.image("weekMonika/images/ddto/Sky"));
    // add(skything);
    insert(game.members.indexOf(game.getLuaObject("skytemp")), skything);
    skything.velocity.x = -30;
    monka.push(skything);
    
    for(i in 0...school.length){
        school[i].color = 0xFF111111;
        monka[i].alpha = 0;
    }
}

// char.shader.var
function onStepHit(){
    switch(curStep){
        case 272:
            for(e in 0...school.length){
                FlxTween.color(school[e], Conductor.crochet / 1000, 0xFF111111, 0xFFFFFFFF);
            }
            // FlxTween.color(game.getLuaObject("bgfreaks"), Conductor.crochet / 1000, 0xFF110000, 0xFFFF8888);
        case 464:
            game.getLuaObject("evil").alpha = 1;
            FlxG.camera.flash(0xFF141452, Conductor.crochet / 400, true);
            for(cu in [dad, boyfriend]){
                cu.shader.color = 0xFF141452;
                cu.shader.setAdjustColor(-66, -10, 40, -23);
            }
        case 1360:
            for(i in 0...monka.length){
                monka[i].alpha = 1;
            }
            FlxG.camera.flash(0xFF803300, Conductor.crochet / 400, true);
            for(cu in [dad, boyfriend]){
                cu.shader.distance = 0;
                cu.shader.setAdjustColor(-40, -10, 24, -23);
            }
        case 1548:
            for(cu in [dad, boyfriend]){
                cu.shader = null;
                cu.colorTransform.color = 0xFFFFFFFF;
            }
            for(i in 0...school.length){
                school[i].alpha = 0.00000000000000000001;
                monka[i].alpha = 0.00000000000000000001;
            }
            game.getLuaObject("evil").alpha = 0;
            FlxG.camera.flash(0xFFFFFFFF, Conductor.crochet / 1000, true);
        case 1800:
            FlxG.camera.fade(0xFF000000, 0.01, false);
    }   
}

function applyshit(obj, name){
        name = new DropShadowShader();
		name.setAdjustColor(-66, -10, 24, -23);
		name.color = 0xFF52351d;
		name.antialiasAmt = 0;
		name.attachedSprite = obj;
		name.distance = 5;
        
        name.angle = 90;
        name.threshold = 0.1;
        obj.shader = name;
        obj.animation.callback = function(anim, frame, index)
        {
            name.updateFrameInfo(obj.frame);
        };
        obj.shader = name;
}