extends RigidBody2D

const max_speed: float = 1250.0;
const max_speed_power2: float = pow(max_speed, 2);
const ease_move_level = 8;

export (float) var min_y = 560;
export (float) var max_y = 800;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

"""func _physics_process(delta):
	var current_mouse_position = get_viewport().get_mouse_position();
	
	if   ( position.y > max_y ):
		position.y = max_y;
		linear_velocity = Vector2(0, 0);
		# mouse is out of area
		if ( current_mouse_position.y > max_y ): return;
	elif ( position.y < min_y ):
		position.y = min_y;
		linear_velocity = Vector2(0, 0);
		# mouse is out of area
		if ( current_mouse_position.y < min_y ): return;
	
	var vx = (current_mouse_position.x - position.x) / delta;
	var vy = (current_mouse_position.y - position.y) / delta;
	# v = |(vx, vy)| <= max_speed
	var mag2 = pow(vx, 2) + pow(vy, 2);
	if  ( mag2 > max_speed_power2 * pow(ease_move_level, 2) ): 
		var magnitude = sqrt(mag2);
		vx = vx / magnitude * max_speed;
		vy = vy / magnitude * max_speed;
	else:
		vx /= ease_move_level;
		vy /= ease_move_level;
	# set Bar's velocity
	linear_velocity = Vector2(vx, vy);"""
	#position = get_viewport().get_mouse_position();

var clicked_position: Vector2 = Vector2(0, 0);
func _input(event):
	if event is InputEventMouseButton:
		# click
		if (event.is_pressed()):
			clicked_position = event.position;
			linear_velocity = Vector2(0, 0);
		# unclick
		else:
			# add force
			var diff = event.position - clicked_position;
			# |diff| <= max_speed
			var mag2 = pow(diff.x, 2) + pow(diff.y, 2)
			if (mag2 > max_speed_power2):
				var magnitude = sqrt(mag2);
				diff = diff * max_speed / magnitude;
			# add
			apply_central_impulse(diff * mass);
			clicked_position = Vector2(0, 0);
