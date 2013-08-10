
KEY_LEFT = 37
KEY_RIGHT = 39

previousX = previousY = null
previousDirection = 0

isMovingRight: (prevX, x) ->
	prevX < x

isMovingUp: (prevY, y) ->
	prevY < y

isMovingClockwise: (prevX, prevY, x, y) ->
	if isMovingRight(prevX, x)
		if not isMovingUp(prevY, y)
			return true
		else
			return false
	else
		if isMovingUp(prevY, y)
			return true
		else
			return false

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

		$(document).on 'vmousedown', (e) =>
			if e.screenX < $(window).width() / 2
				@arrowLeftDownHandler()
			else 
				@arrowRightDownHandler()
			
		$(document).on 'vmouseup', (e) =>
			if e.screenX < $(window).width() / 2
				@arrowLeftUpHandler()
			else 
				@arrowRightUpHandler()

		$(document).on 'mousedown', (e) =>
			console.log 'aaa'
			if e.screenX < $(window).width() / 2
				@arrowLeftDownHandler()
			else 
				@arrowRightDownHandler()
			
		$(document).on 'mouseup', (e) =>
			console.log 'bbb'
			if e.screenX < $(window).width() / 2
				@arrowLeftUpHandler()
			else 
				@arrowRightUpHandler()


		#
		#	ARGH!!!!
		#
		# $(document).on 'vmousedown', (e) =>
		# 	previousX = e.screenX
		# 	previousY = e.screenY

		# $(document).on 'vmousemove', (e) =>
		# 	newX = e.screenX
		# 	newY = e.screenY

		# 	if isMovingClockwise(previousX, previousY, newX, newY)
		# 		if previousDirection == -1
		# 			@arrowLeftUpHandler()
		# 		previousDirection = 1
		# 		@arrowRightDownHandler()
		# 	else
		# 		if previousDirection == 1
		# 			@arrowRightUpHandler()
		# 		previousDirection = -1
		# 		@arrowleftDownHandler()

		# 	previousX = newX
		# 	previousY = newY

		# $(document).on 'vmouseup', (e) =>
		# 	if previousDirection == 1
		# 		@arrowRightUpHandler()
		# 	if previousDirection == -1
		# 		@arrowLeftUpHandler()

module.exports = Input