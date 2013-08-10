
stage = require './stage'
Earth = require './models/Earth'
Input = require './Input'

$ ->
  stage.init()
  stage.getStage().addChild new Earth()
  stage.getStage().update()

  input = new Input
  input.arrow_left_handler = () ->
  	console.log 'should rotate anticlockwise'
  input.arrow_right_handler = () ->
  	console.log 'should rotate clockwise'

