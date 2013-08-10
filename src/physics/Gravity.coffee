
geometry = require '../helpers/geometry'

done = false
active = false

class Gravity

  constructor: ( @pull, @x, @y ) -> null

  updateAngle: ( particle ) =>
    deltaY = @y - particle.y
    deltaX = @x - particle.x
    # gravity_degrees = Math.atan2( deltaY, deltaX ) * 180 / Math.PI
    @angle = Math.atan2( deltaY, deltaX )

  tick: ( particle ) =>

    @updateAngle particle

    # if gravity_degrees < 0 then gravity_degrees = 360+gravity_degrees
    # console.log gravity_degrees

    # if active or (Math.abs particle.x > 20 or Math.abs particle.y > 20)
    #   pu = 2
    #   active = true

    #   origin = x: 0, y: 0
    #   distance = geometry.getDistance origin, particle

    #   if particle.x > 0
    #     particle.x -= pu * distance
    #   else
    #     particle.x += pu * distance

    #   if particle.y > 0
    #     particle.x -= pu * distance
    #   else
    #     particle.x -= pu * distance

    done = true
    # particle.x += @pull * Math.cos (@angle * 180 / Math.PI)
    # particle.y += @pull * Math.sin (@angle * 180 / Math.PI)

module.exports = Gravity