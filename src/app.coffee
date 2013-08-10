
window.onload = (e) ->

  wrap = $ "#game-stage"

  size = width: ($ window).width(), height: ($ window).height()
  wrap.css size
  wrap.attr size

  stage = new createjs.Stage wrap
  circle = new createjs.Shape()
  circle.graphics.beginFill("red").drawCircle 0, 0, 40

  circle.x = circle.y = 50

  stage.addChild circle

  stage.update()
