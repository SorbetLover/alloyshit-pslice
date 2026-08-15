var cfol:FlxSprite;
function onCreate(){
    cfol = new FlxSprite();
    cfol.setPosition(600,300);
}
var lerps = 5;
var poss = [];
var possa = [];
var _jancu = 0;
var defz = 1.1;
var tmr = 0;
function onUpdatePost(elapsed){
    if(dad.animation.name != "idle"){
        tmr = 1;
    }    
    if(tmr >= 0){
        defz = FlxMath.lerp(defz, 0.7, 2 * elapsed);
        cfol.x = FlxMath.lerp(cfol.x, 500, lerps * elapsed);
        cfol.y = FlxMath.lerp(cfol.y, 300, lerps * elapsed);
    } else {
        if(boyfriend.animation.name != "idle"){
            defz = FlxMath.lerp(defz, 1.1, 2 * elapsed);
            cfol.x = FlxMath.lerp(cfol.x, 700, lerps * elapsed);
            cfol.y = FlxMath.lerp(cfol.y, 200, lerps * elapsed);
        }
    }
        // defaultCamZoom = 0.8;
    
    FlxG.camera.follow(cfol);

    // camFollow.x = FlxMath.lerp(camFollow.x, cfol.x, lerps * elapsed);
    // camFollow.y = FlxMath.lerp(camFollow.y, cfol.y, lerps * elapsed);
    // FlxG.camera.snapToTarget();
    _jancu += elapsed;
    FlxG.camera.zoom = defz;
    for(i in 0...possa.length){
        possa[i].x = poss[i] + 40 * Math.sin(_jancu);
    }
    tmr -= elapsed;
}
function onCreatePost(){
    FlxTween.tween(game.getLuaObject("sprite3"), {x: game.getLuaObject("sprite3").x + 3500}, 185);
    for(i in [0,1,2,3,4]){
        game.getLuaObject("dancer" + i).scrollFactor.set(0.8,0.8);
        poss.push(    game.getLuaObject("dancer" + i).x);
        possa.push(   game.getLuaObject("dancer" + i));
    }
    poss.push(game.getLuaObject("sprite1").x);
    possa.push(game.getLuaObject("sprite1"));

}
var eh = false;
function onBeatHit(){
    if(curBeat % 2 == 0){
        for(i in [0,1,2,3,4]){
            game.getLuaObject("dancer" + i).animation.play( eh ? "danceLeft" : "danceRight", true);
        }
        eh = !eh;
    }
}