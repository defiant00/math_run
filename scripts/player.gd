extends KinematicBody2D

const MIN_JUMP = 250
const JUMP = 1000
const GRAVITY = 2000
const MAX_FALL_SPEED = 800
const SNAP_VECTOR = Vector2(0, 8)
const JUMP_GRACE = 0.1

var snap = false
var velocity = Vector2()
var grace_counter = JUMP_GRACE

func _physics_process(delta):
	if Status.gameState == Status.State.RUNNING:
		if Input.is_action_just_pressed("jump") and (grace_counter >= 0):
			velocity.y = -JUMP
			snap = false
			grace_counter = -1
		if Input.is_action_just_released("jump"):
			velocity.y = max(velocity.y, -MIN_JUMP)
		
		if snap:
			grace_counter = JUMP_GRACE
		else:
			grace_counter -= delta
		
		velocity.y = min(velocity.y + (GRAVITY * delta), MAX_FALL_SPEED)
		
		velocity = move_and_slide_with_snap(velocity, SNAP_VECTOR if snap else Vector2.ZERO, Vector2.UP, true)
		
		snap = is_on_floor()
