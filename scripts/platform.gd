extends Node2D

export var width = 500

func _process(delta):
	if Status.gameState == Status.State.RUNNING:
		position.x -= Status.playerSpeed * delta
		if position.x < -6000:
			queue_free()
