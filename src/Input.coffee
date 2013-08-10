
KEY_LEFT = 37
KEY_RIGHT = 39

class Input

	constructor: () ->
		@arrow_left_callback = () ->
			console.log 'Input: left key'
		@arrow_right_callback = () ->
			console.log 'Input: right key'

	setup_bindings: () ->
		$(document).keydown (e) =>
			if e.keyCode == KEY_LEFT
				@arrow_left_callback()
			else if e.keyCode == KEY_RIGHT
				@arrow_right_callback()

	key_arrow_left_event: ->
		@arrow_left_callback()

	key_arrow_right_event: ->
		@arrow_right_callback()

module.exports = Input