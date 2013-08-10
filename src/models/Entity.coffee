
class Entity

  constructor: ->
    @x = 0
    @y = 0

    @stage = new createjs.Stage
    @lastUpdate = new Date().getTime()
    @lastFrameLength = 0

    @render()

  render: -> null

  tick: ->
  	now = new Date().getTime()
  	@lastFrameLength = now - @lastUpdate
  	@lastUpdate = now

module.exports = Entity