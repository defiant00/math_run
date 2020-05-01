extends KinematicBody2D

const JUMP = 1000
const GRAVITY = 1800
const MAX_FALL_SPEED = 800
const SNAP_VECTOR = Vector2(0, 8)

var snap = false
var velocity = Vector2()

func _physics_process(delta):
	if Input.is_action_just_pressed("jump") and snap:
		velocity.y = -JUMP
		snap = false
	
	velocity.y = min(velocity.y + (GRAVITY * delta), MAX_FALL_SPEED)
	
	velocity = move_and_slide_with_snap(velocity, SNAP_VECTOR if snap else Vector2.ZERO, Vector2.UP, true)
	
	snap = is_on_floor()
