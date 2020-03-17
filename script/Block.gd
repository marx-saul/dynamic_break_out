extends RigidBody2D

var shape;
var ownerId;
var boundary;

# Called when the node enters the scene tree for the first time.
func _ready():
	#init(100, 200, 100, 10);
	pass

func init(pos_x: float, pos_y: float, size_x: float, size_y: float):
	# generate shape for the block
	shape = RectangleShape2D.new();
	shape.extents = Vector2(size_x, size_y);
	ownerId = create_shape_owner(self);
	shape_owner_add_shape(ownerId, shape);
	
	# draw boundary
	boundary = Line2D.new();
	boundary.default_color = Color("70E820");
	boundary.width = 1;
	boundary.add_point(Vector2(-size_x, -size_y));
	boundary.add_point(Vector2( size_x, -size_y));
	boundary.add_point(Vector2( size_x,  size_y));
	boundary.add_point(Vector2(-size_x,  size_y));
	boundary.add_point(Vector2(-size_x, -size_y));
	add_child(boundary);
	
	# set position and mass
	position = Vector2(pos_x, pos_y);
	mass = size_x * size_y / 400.0;

const step_num = 40;
const elim_FPS = 1/60.0
# Delete object with an effect
func eliminate():
	# remove colliders
	remove_shape_owner(ownerId);
	#linear_velocity = Vector2(0, 0);
	# lines expands
	for step in range(step_num):
		yield(get_tree().create_timer(elim_FPS), "timeout")
		for pi in range(5):
			# color fade out
			boundary.default_color.a = 1.0 - min(1.25*pow(step/float(step_num), 0.5), 1.0);
			# lines expands
			var point = boundary.get_point_position(pi);
			if (point.x > 0): point.x += 3 - 3*step/step_num;
			if (point.x < 0): point.x -= 3 - 3*step/step_num;
			if (point.y > 0): point.y += 3 - 3*step/step_num;
			if (point.y < 0): point.y -= 3 - 3*step/step_num;
			boundary.set_point_position(pi, point);
