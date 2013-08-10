
Orbiter = require './Orbiter'

loopOn = false

types =
  email: { asset: 'email', speed: { min: 10, max: 15 } }
  upload: { asset: 'upload', speed: { min: 15, max: 20 } }

levels = [
  {
    spawnDelay: min: 1500, max: 5000
    itemTypes: [ 'email', 'upload' ]
  },
  {
    spawnDelay: min: 100, max: 500
    itemTypes: [ 'email', 'upload' ]
  }
]

class ItemsFactory

  constructor: (@stage) ->
    @level = 0
    @entities = []

    if loopOn then @spawnNext()
    ($ 'body').on 'click', => @spawnNext()

  spawnNext: ->
    type = levels[@level].itemTypes[Math.round(Math.random levels[@level].itemTypes.length)]
    options = types[type]
    speed = options.speed.min + Math.random() * options.speed.max - options.speed.min
    entity = new Orbiter options, speed, Math.random() * 360
    @stage.add entity
    @entities.push entity
    waitRange = levels[@level].spawnDelay
    wait = Math.random() * waitRange.min + Math.random() * (waitRange.max - waitRange.min)
    if loopOn then setTimeout (=> @spawnNext()), wait

  tick: -> entity.tick() for entity in @entities

module.exports = ItemsFactory