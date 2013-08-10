
window.onload = (e) ->

  stage = require './stage'
  Earth = require './models/Earth'

  # stage.width = document.body.clientWidth; #document.width is obsolete
  # stage.height = document.body.clientHeight; #document.height is obsolete

  $('#game-stage').css 'width', $('body').width()+'px'
  $('#game-stage').css 'height', $('body').height()+'px'
  # @y = Math.round( $('body').height() / 2 )

  stage.addChild new Earth()
  stage.update()
