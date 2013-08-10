
KEY_LEFT = 37
KEY_RIGHT = 39

class Input

	constructor: () ->
		@arrow_left_handler = () ->
			console.log 'Input: left key'
		@arrow_right_handler = () ->
			console.log 'Input: right key'

		$(document).keydown (e) =>
			if e.keyCode == KEY_LEFT
				@arrow_left_handler()
			else if e.keyCode == KEY_RIGHT
				@arrow_right_handler()

	key_arrow_left_event: ->
		@arrow_left_handler()

	key_arrow_right_event: ->
		@arrow_right_handler()

module.exports = Input