/* global createjs */


//Draw a square on screen.
var canvas = document.getElementById('canvas');
var stage = new createjs.Stage(canvas);
var shape = new createjs.Shape();

shape.graphics.beginFill('rgba(255,0,0,1)').drawRoundRect(0, 0, 120, 120, 10);
stage.addChild(shape);

var ss = new createjs.SpriteSheet({
    "frames": {
        "width": 200,
        "numFrames": 64,
        "regX": 2,
        "regY": 2,
        "height": 361
    },
    "animations": {"jump": [26, 63], "run": [0, 25]},
    "images": ["./assets/runningGrant.png"]
});

ss.getAnimation("run").speed = 2;
ss.getAnimation("run").next = "jump";
ss.getAnimation("jump").next = "run";

var sprite = new createjs.Sprite(ss, "run");
sprite.scaleY = sprite.scaleX = 0.4;

createjs.Ticker.setFPS(60);
createjs.Ticker.addEventListener("tick", stage);
stage.addChild(sprite);

stage.update();