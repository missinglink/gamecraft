
win = $ window
el = $ '#game-stage'

init = ->
  size = width: win.width(), height: win.height()
  el.css size
  el.attr size

$ init

module.exports = new createjs.Stage el[0]