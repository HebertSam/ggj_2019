extends Area2D

var bodies

func _physics_process(delta):
	bodies = get_overlapping_bodies()
	
	print(bodies)
