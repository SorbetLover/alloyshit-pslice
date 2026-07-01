import flixel.math.FlxMath;
import Math;
import backend.Difficulty;

// import flixel.FlxCamera;
var isswaps = false;

function glu(obj){
	return game.getLuaObject(obj);
}
var pos = [[0,0],[0,0]];
function onCreate(){

}
function onCreatePost(){
	isswaps = Difficulty.getString().toUpperCase() == "SWAPPED";
	debugPrint(isswaps + " AAA");
	// for(i in ["overlay", "bg", "bg2", "fg"]){
		// glu(i).scrollFactor.set(0,0);
		// glu(i).screenCenter();
	// }

	glu("overlay").setGraphicSize(FlxG.width - 100, FlxG.height - 60);
	glu("overlay").x = 20;	
	glu("overlay").screenCenter();
	glu("overlay").scrollFactor.set(0,0);

	glu("fg").y = FlxG.height - glu("fg").height - 30;
	// for(i in [boyfriend,gf]){
	 	// i.scrollFactor.set(0,0);

	// }
	dad.x = 235;
	pos[0][0] = dad.x;
	pos[1][0] = 630;
	pos[1][1] = 75;

	glu("bg").x = 45;
	glu("bg2").x = 45;
	var dca = dad.healthColorArray;

	// dad.changeCharacter("ralucam");
	if(isswaps){
		if(iconP1.char != "mineraluca") iconP1.changeIcon("mineraluca");
		if(iconP2.char != "tazercraft") iconP2.changeIcon("tazercraft");
		healthBar.setColors(
			FlxColor.fromRGB(0,255,255), 
			FlxColor.fromRGB(dca[0], dca[1], dca[2]) 
		);

	}
	if(!isswaps){
		healthBar.setColors(
			FlxColor.fromRGB(dca[0], dca[1], dca[2]), 
			FlxColor.fromRGB(0,255,255)
		);
		if(iconP1.char != "tazercraft") iconP1.changeIcon("tazercraft");

	}
	if(FlxG.width > 1280){
		var diff = FlxG.width - 1280;
		debugPrint(diff);
		var limit1 = new FlxSprite(0,0).makeGraphic(1,1,0xFF000000);
		limit1.scrollFactor.set(0,0);
		// limit1.setGraphicSize(diff, FlxG.height + 100);
		limit1.scale.x = (diff /2) + 10;
		limit1.scale.y = FlxG.height;
		limit1.updateHitbox();
		
		add(limit1);

		var limit2 = new FlxSprite(0,0).makeGraphic(1,1,0xFF000000);
		limit2.scrollFactor.set(0,0);
		limit2.scale.x = (diff /2) + 10;
		limit2.scale.y = FlxG.height;
		limit2.updateHitbox();
		add(limit2);
		limit1.cameras = [camHUD];
		limit2.cameras = [camHUD];
		
		// limit1.zoomFactor.set(0,0);
		limit2.setPosition(FlxG.width - diff/2, 0 );
		limit1.setPosition(0, 0);
		gf.x = -7 + diff * FlxG.camera.zoom;
	} else {
		gf.x += 45;
	}
	// debugPrint(FlxG.width);
	// debugPrint(glu("bg").scrollFactor);
	// debugPrint(dad.scrollFactor);
}


var _jancu:Float = 0;
function onUpdatePost(elapsed){
	if(dad.curCharacter == "ralucahero"){
	_jancu += elapsed;
	dad.y = -20 + 30 * Math.sin(_jancu);
	}
	camFollow.setPosition(670,350);
	FlxG.camera.snapToTarget();
}
function onUpdate(elapsed){
	// debugPrint(dad.y);
	if(dad.curCharacter == "ralucahero"){
		// dad.setPosition(pos[0][0], pos[0][1]);
		dad.x = pos[0][0];
		scoreTxt.visible = true;
		iconP1.visible = true;
		iconP2.visible = true;
		healthBar.y = 80;

		boyfriend.visible = true;
		gf.visible = true;
		glu("bg2").visible = false;
		glu("fg").visible = true;
		glu("overlay").visible = false;
	} else {
		glu("overlay").visible = true;
		glu("bg2").visible = true;

		dad.setPosition(pos[1][0], pos[1][1]);
		scoreTxt.visible = false;
		iconP1.visible = false;
		iconP2.visible = false;
		healthBar.y = 10;
		boyfriend.visible = false;
		gf.visible = false;
		glu("fg").visible = false;
	}
	if(isswaps && iconP2.char == "mineraluca"){
		iconP2.changeIcon("tazercraft")
		healthBar.setColors(
			FlxColor.fromRGB(0,255,255)
			, 
			FlxColor.fromRGB(dca[0], dca[1], dca[2])
		);
	}
}

function goodNoteHit(e){
	// debugPrint(e.noteType);
	var dca = dad.healthColorArray;
	var bca = boyfriend.healthColorArray;
	var gca = gf.healthColorArray;
	if(!isswaps){
		switch(e.noteType){
			case "GF Sing":
				if(iconP1.char != "mike") iconP1.changeIcon("mike");
        		healthBar.setColors(FlxColor.fromRGB(dca[0], dca[1], dca[2]), FlxColor.fromRGB(gca[0], gca[1], gca[2]));
			case "Duet":
        		healthBar.setColors(FlxColor.fromRGB(dca[0], dca[1], dca[2]), FlxColor.fromRGB(0,255,255));
				if(iconP1.char != "tazercraft") iconP1.changeIcon("tazercraft");
				gf.holdTimer = 0;
				switch(e.noteData){
					case 0:
						gf.playAnim("singLEFT", true);
					case 1:
						gf.playAnim("singDOWN", true);
					case 2:
						gf.playAnim("singUP", true);
					case 3:
						gf.playAnim("singRIGHT", true);
				}	

			default:
				if(iconP1.char != "pac") iconP1.changeIcon("pac");
        		healthBar.setColors(FlxColor.fromRGB(dca[0], dca[1], dca[2]), FlxColor.fromRGB(bca[0], bca[1], bca[2]));
		}

	}
}

function opponentNoteHit(e){
	if(health >= 0.2){
		// health -= 0.1;
		set_health(health - 0.02);
	}
	// healthbar.value = health;
	var dca = dad.healthColorArray;
	var bca = boyfriend.healthColorArray;
	var gca = gf.healthColorArray;
	if(!isswaps) return;
		switch(e.noteType){
			case "GF Sing":
				if(iconP2.char != "mike") iconP2.changeIcon("mike");
        		healthBar.setColors(
					FlxColor.fromRGB(gca[0], gca[1], gca[2])
					, 
					FlxColor.fromRGB(dca[0], dca[1], dca[2])
					);
			case "Duet":
        		healthBar.setColors(
					FlxColor.fromRGB(0,255,255)
					, 
					FlxColor.fromRGB(dca[0], dca[1], dca[2])
				);
				if(iconP2.char != "tazercraft") iconP2.changeIcon("tazercraft");
				gf.holdTimer = 0;
				switch(e.noteData){
					case 0:
						gf.playAnim("singLEFT", true);
					case 1:
						gf.playAnim("singDOWN", true);
					case 2:
						gf.playAnim("singUP", true);
					case 3:
						gf.playAnim("singRIGHT", true);
				}	

			default:
				if(iconP2.char != "pac") iconP2.changeIcon("pac");
        		healthBar.setColors(
					FlxColor.fromRGB(bca[0], bca[1], bca[2])
					, 
					FlxColor.fromRGB(dca[0], dca[1], dca[2])
				);
		}
}