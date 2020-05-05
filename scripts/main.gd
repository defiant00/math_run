extends Node2D

const NUM_PLATFORMS = 1
var platforms = []
var nextHeight = 400
var spawnCounter = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	for i in range(NUM_PLATFORMS):
		platforms.append(load("res://scenes/platforms/p%s.tscn" % i))
	add_platform(0, 0, 200)
	add_platform(0, 600, 400)

func add_platform(index, x, y):
	var p = platforms[index].instance()
	p.position = Vector2(x, y)
	add_child(p)
	return p.width

func next_height():
	nextHeight += (randi() % 500) - 100

func _process(delta):
	Status.playerSpeed += delta * 50
	Status.playerSpeed = min(Status.playerSpeed, Status.MAX_PLAYER_SPEED)
	
	spawnCounter -= Status.playerSpeed * delta
	if spawnCounter < 0:
		var width = add_platform(randi() % NUM_PLATFORMS, 1300 + spawnCounter, nextHeight)
		
		var cur = nextHeight
		next_height()
		var heightChange = nextHeight - cur
		
		var gap = max((randi() % int(Status.playerSpeed * 0.8 + heightChange) + 20), heightChange)
		spawnCounter += width + gap
