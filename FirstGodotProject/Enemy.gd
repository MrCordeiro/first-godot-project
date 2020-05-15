extends Area2D

# The problem we have with this script right now is, when we make a modification
# to the values, it is going to affect every Enemy instance in the scene.

# We want to vary the speed and the distance that each enemy moves at. To do so,
# we can use an export keyword at the start of the variables.

# The export keyword allows the variables to appear in the inspector.
export var speed : int = 100
export var moveDist : int = 100

onready var startX : int = position.x
onready var targetX : int = position.x + moveDist


# Built-in function that gets called every single frame
func _process(delta):
	
	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX


func move_to (current, to, step):
 
	var new = current
	 
	if new < to:
		new += step
		if new > to:
			new = to
	else:
		new -= step
		if new < to:
			new = to
	return new



func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
