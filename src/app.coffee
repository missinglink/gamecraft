
window.onload = (e) ->

  stage = require './stage'

  circle = new createjs.Shape();
  circle.graphics.beginFill("red").drawCircle(0, 0, 40);

  circle.x = circle.y = 50;

  stage.addChild(circle);

  stage.update();

