
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Particles extends Entity

  constructor: ->
    @x = 0
    @y = 0
    @radius = 5
    @ready = false

    @particle =
      text: 0
      font:
        style: 'bold'
        size: '12px'
        face: 'Arial'
      color: 'green'
      width: 10
      height: 10
      rotation: 0
      x: 0
      y: 0

    @maxRotate = Math.round( Math.random() )

    @direction = 0
    @particles = []
    
    super

  tick: ->

    @stage.x = translate.x 0
    @stage.y = translate.y 0

    @change = {}
    @direction += ( Math.round( Math.random() * @maxRotate * 2 ) - @maxRotate )

    @particle.x += @particle.width * Math.cos @direction
    @particle.y += @particle.height * Math.sin @direction

    if Math.round Math.random()
      @particle.font.style = 'bold'
    else
      @particle.font.style = ''

    # @change.x = Math.floor( Math.random() * @particle.width * 2 ) - @particle.width
    # @change.y = Math.floor( Math.random() * @particle.height * 2 ) - @particle.height

    @particle.rotation = @direction
    @particle.text = Math.round Math.random() * 1
    # @particle.text = '☺'
    # @particle.x = @change.x
    # @particle.y = @change.y

    font = [ @particle.font.style, @particle.font.size, @particle.font.face ].join(' ')

    text = new createjs.Text @particle.text, font, @particle.color
    text.x = @particle.x
    text.y = @particle.y
    text.rotation = @particle.rotation
    text.textBaseline = 'alphabetic'
    text.date = (new Date()).getTime()

    @particles = @particles.filter (particle) =>
      if particle.date < (new Date()).getTime() - 1000
        @stage.removeChild particle
        return false
      return true

    @particles.push text
    @stage.addChild text

  render: ->

  # @stage.x = translate.x 0
  # @stage.y = translate.y 0

  # @particle = new createjs.Shape()
  # @particle.graphics.beginFill('blue').drawCircle 0, 0, translate.screen @radius
  # @stage.addChild @particle

module.exports = Particles