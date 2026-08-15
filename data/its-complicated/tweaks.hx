var merda:Bool = false;
function onCreate(){}
var middleSecs:Array = [
    30,  31,   32,  33,  34, 35, 36, 37, 
    40,  44, 
    72,  73,   74,  75,  76, 77, 78, 79, 80, 
    84,  85,   86,  87,  88, 
    102, 103,  104, 105, 
    107, 108,  109
];
function onSectionHit(){
    PlayState.instance.cameraSpeed = mustHitSection ? 1.5 : 2.5;
    if(middleSecs.contains(curSection)){
        merda = true;
    } else {
        merda = false;
    }
}   
//  554

function onUpdatePost(){
    if(merda == true)camFollow.setPosition(500, 554);
}