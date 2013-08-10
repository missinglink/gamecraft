
colors = require './helpers/colors'

life = 0
lifeBar = null

lifeColors =
  full: $.Color '#e2f329'
  empty: $.Color '#c82e44'

module.exports =

  init: ->
    lifeBar = $ '#life-bar'
    @reset false

  setLife: (val, animate = true) ->
    life = val
    color = colors.mixRGB lifeColors.full, lifeColors.empty, val

    css = width: "#{life}%", backgroundColor: color.toHexString()

    if animate
      lifeBar.stop().transition css, 300
    else
      lifeBar.css css

  removeLife: (amt) ->
    lifeBar.css background: '#ff0000'
    @setLife @getLife() - amt

  getLife: -> life

  reset: (animate = true) -> @setLife 100, animate