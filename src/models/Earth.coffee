
class Earth extends createjs.Shape

  constructor: ->
    super

    @graphics.beginFill('red').drawCircle 0, 0, 40

    @x = 50
    @y = 50

module.exports = Earth