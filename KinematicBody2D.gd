extends KinematicBody2D

export (int) var SPEED = 5

var motion = Vector2()


func get_input():
	if Input.is_action_pressed('ui_right'):
		motion.x += 1

	elif Input.is_action_pressed('ui_left'):
		motion.x -= 1
	
	elif Input.is_action_pressed('ui_up'):
		motion.y -= 1
	elif Input.is_action_pressed('ui_down'):
		motion.y += 1
		
	else:
		motion.x = 0
		motion.y = 0
		
	motion = motion.normalized() * SPEED

func _physics_process(delta):
	get_input()
	move_and_collide(motion)
