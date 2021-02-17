extends KinematicBody
class_name PhysicsOld
#node should be a kinematic body before adding
#this script
#rotation physics
var rotnum
#gravity
var gravity = 15
var fall = Vector3()

func _ready():
	randomize()
	var num = randi()% 2 + 1
	if num == 1:
		rotnum = 2
	elif num == 2:
		rotnum = -2
func _process(delta):
	if not is_on_floor() and rotnum: #if we're not on floor..
		fall.y -= gravity * delta
		rotation.y += rotnum * delta
		rotation.z -= rotnum * delta
	move_and_slide(fall, Vector3.UP, true)
	if is_on_floor():
		randomize()
		if fall.y != 0:
			var bounce = abs(fall.y) - 6
			if bounce > 5:
				fall.x = rand_range(3, -3)
				fall.z = rand_range(3, -3)
				rotation.y = rand_range(3,-3)
				rotation.x = rand_range(3,-3)
				rotation.z = rand_range(3,-3)
			else:
				fall.x = 0
				fall.z = 0
				rotation.y = 0
				rotation.x = 0
				rotation.z = 0
			fall.y = bounce
