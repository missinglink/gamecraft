
life = 0
lifeBar = null

module.exports =

  init: -> $ '#life-bar'

  setLife: (val) ->
    life = val
    lifeBar.css width: "#{life}%"

  getLife: -> life

  reset: -> @setLife 100
