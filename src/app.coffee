
window.onload = (e) ->

  stage = require './stage'
  earth = require './shapes/earth'

  stage.addChild earth
  stage.update()
