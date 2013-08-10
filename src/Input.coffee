
KEY_LEFT = 37
KEY_RIGHT = 39

class Input

	constructor: () ->
		@arrow_left_down_handler = () ->
			console.log 'Input: left key down'
		@arrow_left_up_handler = () ->
			console.log 'Input: left key up'			
		@arrow_right_down_handler = () ->
			console.log 'Input: right key down'
		@arrow_right_up_handler = () ->
			console.log 'Input: right key up'

		$(document).keydown (e) =>
			if e.keyCode == KEY_LEFT
				@arrow_left_down_handler()
			else if e.keyCode == KEY_RIGHT
				@arrow_right_down_handler()

		$(document).keyup (e) =>
			if e.keyCode == KEY_LEFT
				@arrow_left_up_handler()
			else if e.keyCode == KEY_RIGHT
				@arrow_right_up_handler()

module.exports = Input