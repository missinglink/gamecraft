
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Earth extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 60

    super

  render: ->
    @globe = new createjs.Shape()

    @globe.graphics.beginFill('red').drawCircle 0, 0, translate.screen @radius

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    @stage.rotation+=10

    @stage.addChild @globe
    
    @satellite = new createjs.Bitmap 'img/satellite-dish.png'
    @satellite.x = - @radius / 2
    @satellite.y = - @radius / 2
    @satellite.scaleX = translate.screen .7
    @satellite.scaleY = translate.screen .7

    @stage.addChild @satellite

module.exports = Earth