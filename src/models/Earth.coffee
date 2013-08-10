
stage = require '../stage'

class Earth extends createjs.Shape

  constructor: ->
    super

    radius = 100

    @graphics.beginFill('red').drawCircle 0, 0, radius

    @x = Math.round( $('body').width() / 2 )
    @y = Math.round( $('body').height() / 2 )

    console.log @x, @y

module.exports = Earth