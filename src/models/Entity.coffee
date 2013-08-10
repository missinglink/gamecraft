
class Entity

  constructor: ->
    @x = 0
    @y = 0

    @stage = new createjs.Stage

    @render()

  render: -> null
  tick: -> null

module.exports = Entity