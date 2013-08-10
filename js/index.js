/* global createjs */

var game = {};

game.stage = new createjs.Stage("game-stage");
circle = new createjs.Shape();
circle.graphics.beginFill("red").drawCircle(0, 0, 40);
//Set position of Shape instance.
circle.x = circle.y = 50;
//Add Shape instance to stage display list.
stage.addChild(circle);
//Update stage will render next frame
stage.update();