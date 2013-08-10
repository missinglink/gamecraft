
KEY_LEFT = 37
KEY_RIGHT = 39

class Input

	constructor: () ->
		@arrowLeftDownHandler = () ->
			console.log 'Input: left key down'
		@arrowLeftUpHandler = () ->
			console.log 'Input: left key up'			
		@arrowRightDownHandler = () ->
			console.log 'Input: right key down'
		@arrowRightUpHandler = () ->
			console.log 'Input: right key up'

		$(document).keydown (e) =>
			if e.keyCode == KEY_LEFT
				@arrowLeftDownHandler()
			else if e.keyCode == KEY_RIGHT
				@arrowRightDownHandler()

		$(document).keyup (e) =>
			if e.keyCode == KEY_LEFT
				@arrowLeftUpHandler()
			else if e.keyCode == KEY_RIGHT
				@arrowRightUpHandler()

module.exports = Input