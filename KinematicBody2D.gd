extends KinematicBody2D

export (int) var SPEED = 5

var motion = Vector2()


func get_input():
	motion = Vector2()
	var moved = false;
	if Input.is_action_pressed('ui_right'):
		motion.x += 1
		$Sprite.play('walk')
		moved = true
	if Input.is_action_pressed('ui_left'):
		motion.x -= 1
		$Sprite.play('walk')
		moved = true
	if Input.is_action_pressed('ui_up'):
		motion.y -= 1
		$Sprite.play('walk')
		moved = true
	if Input.is_action_pressed('ui_down'):
		motion.y += 1
		$Sprite.play('walk')
		moved = true
	if motion.x == 1 && motion.y == -1:
		rotation_degrees = 45
	elif motion.x == 1 && motion.y == 1:
		rotation_degrees = 135
	elif motion.x == -1 && motion.y == -1:
		rotation_degrees = 315
	elif motion.x == -1 && motion.y == 1:
		rotation_degrees = 225
	elif motion.x == 1:
		rotation_degrees = 90
	elif motion.x == -1:
		rotation_degrees = 270
	elif motion.y == -1:
		rotation_degrees = 0
	elif motion.y == 1:
		rotation_degrees = 180
	if !moved:
		$Sprite.play('idle')
	
	motion = motion.normalized() * SPEED
	if Input.is_action_pressed('ui_select'):
		var temp = 1

func _physics_process(delta):
	get_input()
	move_and_collide(motion)
	
	if global_position.x < 0:
		global_position.x = 0;
	if global_position.y < 0:
		global_position.y = 0;
	var projectResolution = get_viewport().size
	


func _on_Area2D_area_entered(area):
	print('hello ' + area)


func _on_Area2D_body_entered(body):
	print(body)
	pass # replace with function body
