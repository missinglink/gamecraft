
class GameModel

	constructor: ->
		@duration = 15
		@timeLeft = @duration

	tick: (timeDelta) =>
		if timeDelta
			@timeLeft -= timeDelta

	isGameOver: =>
		@timeLeft <= 0

module.exports = GameModel