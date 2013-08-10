
class Gravity

  constructor: ( @pull, @x, @y ) -> null

  updateAngle: ( particle ) =>
    deltaY = @y - particle.y
    deltaX = @x - particle.x
    gravity_degrees = Math.atan2( deltaY, deltaX ) * 180 / Math.PI
    @angle = Math.atan2( deltaY, deltaX )

  tick: ( particle ) =>

    @updateAngle particle

    # if gravity_degrees < 0 then gravity_degrees = 360+gravity_degrees
    # console.log gravity_degrees

    particle.x += @pull * Math.cos @angle * 180 / Math.PI
    particle.y += @pull * Math.sin @angle * 180 / Math.PI

module.exports = Gravity