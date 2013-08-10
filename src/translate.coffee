
stage = require './stage'

ratio = 1

module.exports =

  world: (obj) -> obj * ratio

  screen: (obj) -> obj / ratio

  x: (x) -> stage.getSize().width / 2 + x

  y: (y) -> stage.getSize().height / 2 + y