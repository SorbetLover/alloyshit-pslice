import backend.Difficulty;
// import backend.Mods;
function onCreate(){}
var isswap = false;
function onCreatePost(){
    isswap = Difficulty.getString().toUpperCase() == "SWAPPED";
    if(PlayState.SONG.song == "crybaby"){
        isswap = false;
    }
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
                dad.playAnim("singLEFT" + ((altAnim && dad.animation.exists("singLEFT-alt") == true) ? "-alt":""), true);
            case 1:
                dad.playAnim("singDOWN" + ((altAnim && dad.animation.exists("singDOWN-alt") == true) ? "-alt":""), true);
            case 2:
                dad.playAnim("singUP" + ((altAnim && dad.animation.exists("singUP-alt") == true) ? "-alt":""), true);
            case 3:
                dad.playAnim("singRIGHT" + ((altAnim && dad.animation.exists("singRIGHT-alt") == true) ? "-alt":""), true);
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
                boyfriend.playAnim("singLEFT" + ((altAnim && boyfriend.animation.exists("singLEFT-alt") == true) ? "-alt":""), true);
            case 1:
                boyfriend.playAnim("singDOWN" + ((altAnim && boyfriend.animation.exists("singDOWN-alt") == true) ? "-alt":""), true);
            case 2:
                boyfriend.playAnim("singUP" + ((altAnim && boyfriend.animation.exists("singUP-alt") == true) ? "-alt":""), true);
            case 3:
                boyfriend.playAnim("singRIGHT" + ((altAnim && boyfriend.animation.exists("singRIGHT-alt") == true) ? "-alt":""), true);
        }
    }
}