
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Particles extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 5

    super

  tick: ->
    @stage.rotation+=10

  render: ->

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    @particle = new createjs.Shape()
    @particle.graphics.beginFill('blue').drawCircle 0, 0, translate.screen @radius
    @stage.addChild @particle

module.exports = Particles