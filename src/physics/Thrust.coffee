
class Thrust

  constructor: ( @speed, @angle ) -> null

  setSpeed: ( @speed ) =>
    if @speed < 0 then @speed = 0

  setAngle: ( @angle ) =>
    if @angle > 360 then @angle = @angle-360
    else if @angle <= 0 then @angle = 360+@angle

  tick: ( particle ) =>
    particle.x -= @speed * Math.sin @angle * Math.PI / 180
    particle.y -= @speed * Math.cos @angle * Math.PI / 180
    particle.rotation = Math.round -@angle

module.exports = Thrust