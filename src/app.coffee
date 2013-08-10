
window.onload = (e) ->

  stage = new createjs.Stage("game-stage");
  circle = new createjs.Shape();
  circle.graphics.beginFill("red").drawCircle(0, 0, 40);

  circle.x = circle.y = 50;

  stage.addChild(circle);

  stage.update();

