extends RigidBody2D

const max_speed: float = 1250.0;
const max_speed_power2: float = pow(max_speed, 2);
const ease_move_level = 8;

export (float) var min_y = 560;
export (float) var max_y = 800;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

var clicked_position: Vector2 = Vector2(0, 0);
func _input(event):
	if event is InputEventMouseButton:
		# click
		if (event.is_pressed()):
			clicked_position = event.position;
			mode = RigidBody2D.MODE_STATIC;
			# show arrow
			$arrow.show();
		# unclick
		else:
			mode = RigidBody2D.MODE_CHARACTER;
			# add force
			var diff = event.position - clicked_position;
			# |diff| <= max_speed
			var mag2 = pow(diff.x, 2) + pow(diff.y, 2)
			if (mag2 > max_speed_power2):
				var magnitude = sqrt(mag2);
				diff = diff * max_speed / magnitude;
			# add
			apply_central_impulse(diff * mass);
			# arrow
			$arrow.hide();
	"""# arrow
	if ($arrow.is_visible()):
		if event is InputEventMouseMotion:
			#print_debug("here");
			$arrow.set_point_position(1, $arrow.get_point_position(0) + event.position - clicked_position );"""

func _physics_process(delta):
	# arrow
	if   ($arrow.is_visible()):
		var center_pos = ($Boundary.get_point_position(0)+$Boundary.get_point_position(2)) / 2;
		$arrow.set_point_position(0, center_pos);
		$arrow.set_point_position(1, center_pos + get_viewport().get_mouse_position() - clicked_position);
