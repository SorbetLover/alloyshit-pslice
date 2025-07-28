import Reflect;
var txtshit:FlxText;
function onCreate(){}
function onCreatePost() {
    comboGroup.x = 10000;
    // txtshit = new FlxText(10, 20, 1000, "SAVES");
    // FlxG.save.data.songspeed = 1;
    // for (key in Reflect.fields(FlxG.save.data)) {
    //     // CORRIGIDO: usar && (E) ao invés de || (OU), e comparar direito
    //     if (key != "songRating" && key != "songScores" && key != "songFCState" && key != "favSongIds" && key != "arrowRGBPixel") {
    //         var value = Reflect.field(FlxG.save.data, key);
    //         txtshit.text += "\n " + key + " = " + value;
    //     }
    // }
    // add(txtshit);
    // txtshit.cameras = [camHUD];
}

function onUpdatePost(){
    if (FlxG.keys.justPressed.I) {
        var shift = FlxG.keys.pressed.SHIFT;
        PlayState.instance.playbackRate += shift ? 0.05 : 0.1;
        debugPrint(PlayState.instance.playbackRate);
    }

    if (FlxG.keys.justPressed.O) {
        var shift = FlxG.keys.pressed.SHIFT;
        PlayState.instance.playbackRate -= shift ? 0.05 : 0.1;
        debugPrint(PlayState.instance.playbackRate);
    }
    if(FlxG.keys.justPressed.P){
        PlayState.instance.playbackRate = 0;
    }
}