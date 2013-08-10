
class Earth extends createjs.Stage

  constructor: ->
    super

    radius = 100

    @globe = new createjs.Shape()

    @globe.graphics.beginFill('red').drawCircle 0, 0, radius
    @x = Math.round( $('body').width() / 2 )
    @y = Math.round( $('body').height() / 2 )

    @addChild @globe
    
    @satellite = new createjs.Bitmap 'img/satellite-dish.png'
    @satellite.x = -50
    @satellite.y = -220

    @addChild @satellite

module.exports = Earth