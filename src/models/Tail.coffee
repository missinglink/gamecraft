
stage = require '../stage'
translate = require '../translate'
Entity = require './Entity'

class Tail extends Entity

  constructor: ->
    @x = 0
    @y = 0

    @tail =
      text: 0
      font:
        style: 'bold'
        size: '16px'
        face: 'Arial'
      color: 'green'
      width: 14
      height: 14
      rotation: 0
      x: 0
      y: 0

    @maxRotate = Math.round( Math.random() )

    @direction = 0
    @tails = []
    
    super

  tick: ( particle ) ->

    # @stage.x = translate.x 0
    # @stage.y = translate.y 0

    @change = {}
    @direction += ( Math.round( Math.random() * @maxRotate * 2 ) - @maxRotate )

    # @tail.x += @tail.width * Math.cos @direction
    # @tail.y += @tail.height * Math.sin @direction

    @tail.x = particle.x-10
    @tail.y = particle.y-10

    if Math.round Math.random()
      @tail.font.style = 'bold'
    else
      @tail.font.style = ''

    # @change.x = Math.floor( Math.random() * @tail.width * 2 ) - @tail.width
    # @change.y = Math.floor( Math.random() * @tail.height * 2 ) - @tail.height

    @tail.rotation = @direction
    @tail.text = Math.round Math.random() * 1
    # @tail.text = '☺'
    # @tail.x = @change.x
    # @tail.y = @change.y

    font = [ @tail.font.style, @tail.font.size, @tail.font.face ].join(' ')

    text = new createjs.Text @tail.text, font, @tail.color
    text.x = @tail.x
    text.y = @tail.y
    text.rotation = @tail.rotation
    text.textBaseline = 'alphabetic'
    text.date = (new Date()).getTime()

    @tails = @tails.filter (tail) =>
      if tail.date < (new Date()).getTime() - 2000
        @stage.removeChild tail
        return false
      return true

    @tails.push text
    @stage.addChild text

module.exports = Tail