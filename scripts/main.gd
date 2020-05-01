extends Node2D

const NUM_PLATFORMS = 1
var platforms = []
var latestHeight = 400
var spawnCounter = 100

onready var scroll_script = load("res://scripts/scroll_left.gd")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(NUM_PLATFORMS):
		platforms.append(load("res://scenes/platforms/p%s.tscn" % i))
	add_platform(0, 0, 200)
	add_platform(0, 600, 400)

func add_platform(index, x, y):
	var p = platforms[index].instance()
	p.position = Vector2(x, y)
	p.script = scroll_script
	add_child(p)

func next_height():
	latestHeight += (randi() % 100) - 50
	return latestHeight

func _process(delta):
	spawnCounter -= Status.playerSpeed * delta
	if spawnCounter < 0:
		add_platform(randi() % NUM_PLATFORMS, 1300 + spawnCounter, next_height())
		spawnCounter += 550 + ((randi() % 20) * 10)
