import objects.Note;
import backend.Difficulty;

import Type;
import Reflect;
import lime.system.Clipboard;

var thenotes = [[],[]];
function onCreate(){

}
function onCreatePost(){
	game.getLuaObject("sprite1").color = 0xFF777777;
	gf.color = 0xFF777777;


	var vig = new FlxSprite().loadGraphic(Paths.image("stages/ddto/club/vignette"));
	// add(vig);
	insert(0,vig);
	vig.cameras = [camHUD];
	vig.scrollFactor.set(0,0);
	vig.setGraphicSize(FlxG.width, FlxG.height);
	vig.screenCenter();
	for(i in unspawnNotes){
		if(i.mustPress == false){
			i.noteType = "crazey";
		}
	}
	if(Difficulty.getString().toUpperCase() == "SWAPPED") noteShit();
}
function noteShit(){
	for(i in unspawnNotes){
		if(i.mustPress == false){
			i.mustPress = true;
			i.noteType = "crazey";
			i.noAnimation = true;
			i.noMissAnimation = true;
		}
	}
	// for(i in 0...24){
	// 	var ee = new Note(i * 500, FlxG.random.int(0,3),null, false, false, null);
	// 	ee.mustPress = true;
	// 	ee.noteType = "crazey";
	// 	unspawnNotes.insert(i, ee);
	// }
}
var gft = false;
/// 332 399
var op = [332,399];
function goodNoteHit(e){
	thingnote(e);
}
function opponentNoteHit(e){
	thingnote(e);
}
function thingnote(e){
	if(e.noteType == "crazey"){
		dad.holdTimer = 0;
		// gf.playAnim("necksnap");
		gft = true;
		switch(e.noteData){
			case 0:
				dad.playAnim("singLEFT", true);
			case 1:
				dad.playAnim("singDOWN", true);
			case 2:
				dad.playAnim("singUP", true);
			case 3:
				dad.playAnim("singRIGHT", true);
    	}	
	} else {
		gft = false;
	}
}
var ofs = 30;

function onUpdatePost(){
	FlxG.camera.followLerp = 0.1;
	switch(dad.animation.curAnim.name){
		case "singLEFT":
				camFollow.setPosition(op[0] - ofs, op[1]);

		case "singRIGHT":
				camFollow.setPosition(op[0] + ofs, op[1]);

		case "singUP":
				camFollow.setPosition(op[0], op[1] - ofs);
		
		case "singDOWN":
				camFollow.setPosition(op[0], op[1] + ofs);
		default:
			FlxG.camera.followLerp = 0.03;

	}
	if(gft) {
		gf.playAnim("necksnap");
	}
}

/// HOW TO SPAWN NOTE
/**
	var cu = new Note(TIME, INDEX, null, false, false, null);
	cu.mustPress = WICHSTRUM;
	unspawnNotes.insert(position, cu);

**/
