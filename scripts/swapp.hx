import backend.Difficulty;
// import backend.Mods;
function onCreate(){}
var isswap = false;
function onCreatePost(){
    isswap = Difficulty.getString().toUpperCase() == "SWAPPED";
    if(PlayState.SONG.song == "crybaby"){
        isswap = false;
    }
    if(!isswap) return;
    // debugPrint(PlayState.SONG.song);
    // if(getModSetting("forceswap") == true && Mods.currentModDirectory != "alloyshit-pslice" && Mods.currentModDirectory != "alloyshit-pslice-main"){
        // isswap = true;
    // }
    debugPrint(boyfriend.animation.exists("singUP-alt"));
    if(isswap){
        for(i in unspawnNotes){
            i.noMissAnimation = true;
            i.noAnimation = true;
            if(i.mustPress == false && i.extraData.get("extratype") != "plnote"){
                i.mustPress = true;
                i.extraData.set("extratype", "oppnote");
            }
            if(i.mustPress == true && i.extraData.get("extratype") != "oppnote"){
                i.extraData.set("extratype", "plrnote");
                i.mustPress = false;
            }
        }
    }

    // healthBar.flipX = true;
    if(isswap){
        var ics = [];
        ics.push(iconP1.getCharacter());
        ics.push(iconP2.getCharacter());
        iconP1.changeIcon(ics[1], true);
        iconP2.changeIcon(ics[0], false);
        var hcs = [];
        hcs.push(dad.healthColorArray);
        hcs.push(boyfriend.healthColorArray);
        // debugPrint(hcs);
        healthBar.setColors(FlxColor.fromRGB(hcs[1][0],hcs[1][1],hcs[1][2]), FlxColor.fromRGB(hcs[0][0],hcs[0][1],hcs[0][2]));

    }
}


function goodNoteHit(e){
    if(!isswap) return;
    e.noAnimation = true;
    e.noMissAnimation = true;
    if(e.gfNote){
        
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

    } else {
        dad.holdTimer = 0;
        switch(e.noteData){
            case 0:
                dad.playAnim("singLEFT" + ((e.altAnim && dad.animation.exists("singLEFT-alt") == true) ? "-alt":""), true);
            case 1:
                dad.playAnim("singDOWN" + ((e.altAnim && dad.animation.exists("singDOWN-alt") == true) ? "-alt":""), true);
            case 2:
                dad.playAnim("singUP" + ((e.altAnim && dad.animation.exists("singUP-alt") == true) ? "-alt":""), true);
            case 3:
                dad.playAnim("singRIGHT" + ((e.altAnim && dad.animation.exists("singRIGHT-alt") == true) ? "-alt":""), true);
        }	
    }
}

function opponentNoteHit(e){
    if(!isswap) return;
    e.noAnimation = true;
    e.noMissAnimation = true;
     if(e.gfNote){
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
    } else {

    boyfriend.holdTimer = 0;
    
        switch(e.noteData){
            case 0:
                boyfriend.playAnim("singLEFT" + ((e.altAnim && boyfriend.animation.exists("singLEFT-alt") == true) ? "-alt":""), true);
            case 1:
                boyfriend.playAnim("singDOWN" + ((e.altAnim && boyfriend.animation.exists("singDOWN-alt") == true) ? "-alt":""), true);
            case 2:
                boyfriend.playAnim("singUP" + ((e.altAnim && boyfriend.animation.exists("singUP-alt") == true) ? "-alt":""), true);
            case 3:
                boyfriend.playAnim("singRIGHT" + ((e.altAnim && boyfriend.animation.exists("singRIGHT-alt") == true) ? "-alt":""), true);
        }
    }
}