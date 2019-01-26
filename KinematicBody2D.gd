extends KinematicBody2D

export (int) var SPEED = 5

var motion = Vector2()


func get_input():
	motion = Vector2()
	if Input.is_action_pressed('ui_right'):
		motion.x += 1
	if Input.is_action_pressed('ui_left'):
		motion.x -= 1
	if Input.is_action_pressed('ui_up'):
		motion.y -= 1
	if Input.is_action_pressed('ui_down'):
		motion.y += 1
		
	motion = motion.normalized() * SPEED

func _physics_process(delta):
	get_input()
	move_and_collide(motion)
	if global_position.x < 0:
		global_position.x = 0;
	if global_position.y < 0:
		global_position.y = 0;
	var projectResolution = get_viewport().size
	#$Camera2D.offset.x = global_position.x;
	#$Camera2D.offset.y = global_position.y;
	
