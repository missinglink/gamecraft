
class Entity

  constructor: ->
    @x = 0
    @y = 0

    @stage = new createjs.Stage

    @render()

  render: ->

module.exports = Entity