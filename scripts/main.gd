extends Node2D

const BG_SPEED_MULT = 0.5
const NUM_PLATFORMS = 1
var platforms = []
var nextHeight = 400
var spawnCounter = 100
var startCounter = 4

onready var bg = $ParallaxBackground/ParallaxLayer/bg
onready var middleText = $UI/Label
onready var platformContainer = $platforms

# Called when the node enters the scene tree for the first time.
func _ready():
	Status.gameState = Status.State.COUNTDOWN
	randomize()
	for i in range(NUM_PLATFORMS):
		platforms.append(load("res://scenes/platforms/p%s.tscn" % i))
	add_platform(0, 0, 200)
	add_platform(0, 600, 400)

func add_platform(index, x, y):
	var p = platforms[index].instance()
	p.position = Vector2(x, y)
	platformContainer.add_child(p)
	return p.width

func next_height():
	nextHeight += (randi() % 500) - 100

func _process(delta):
	if startCounter >= 1:
		var prior = int(startCounter)
		startCounter -= delta
		var cur = int(startCounter)
		if prior != cur:
			if cur >= 1:
				middleText.text = "%s" % cur
			else:
				middleText.text = "Go!"
		if startCounter <= 1:
			Status.gameState = Status.State.RUNNING
	else:
		# hide Go! label after a second
		if startCounter > 0:
			startCounter -= delta
			if startCounter <= 0:
				middleText.visible = false
		# speed up player
		Status.playerSpeed += delta * 50
		Status.playerSpeed = min(Status.playerSpeed, Status.MAX_PLAYER_SPEED)
		
		# move the bg
		bg.position.x -= Status.playerSpeed * delta * BG_SPEED_MULT
		while bg.position.x < -1024:
			bg.position.x += 1024
		
		# spawn platforms
		spawnCounter -= Status.playerSpeed * delta
		if spawnCounter < 0:
			var width = add_platform(randi() % NUM_PLATFORMS, 1300 + spawnCounter, nextHeight)
			
			var cur = nextHeight
			next_height()
			var heightChange = nextHeight - cur
			
			var gap = max((randi() % int(Status.playerSpeed * 0.8 + heightChange) + 20), heightChange)
			spawnCounter += width + gap


func _on_start_timer_timeout():
	print('tick')
	pass # Replace with function body.
