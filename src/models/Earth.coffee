
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Earth extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 100

    super

  render: ->
    @sprite = new createjs.Shape

    x = Math.round stage.getSize().width / 2
    y = Math.round stage.getSize().height / 2

    console.log '--', (translate.screen x, y, @radius)
    @sprite.graphics.beginFill('red').drawCircle (translate.screen x, y, @radius)

module.exports = Earth