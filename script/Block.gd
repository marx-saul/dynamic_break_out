extends RigidBody2D

# Called when the node enters the scene tree for the first time.
func _ready():
	#init(100, 200, 100, 10);
	pass

func init(pos_x: float, pos_y: float, size_x: float, size_y: float):
	# generate shape for the block
	var shape = RectangleShape2D.new();
	shape.extents = Vector2(size_x, size_y);
	var ownerId = create_shape_owner(self);
	shape_owner_add_shape(ownerId, shape);
	
	# draw boundary
	var boundary = Line2D.new();
	boundary.default_color = Color("70E820");
	print_debug(str(boundary.default_color.r) + ", " + str(boundary.default_color.g) + ", " + str(boundary.default_color.b));
	boundary.width = 1;
	boundary.add_point(Vector2(-size_x, -size_y));
	boundary.add_point(Vector2( size_x, -size_y));
	boundary.add_point(Vector2( size_x,  size_y));
	boundary.add_point(Vector2(-size_x,  size_y));
	boundary.add_point(Vector2(-size_x, -size_y));
	add_child(boundary);
	
	position = Vector2(pos_x, pos_y);

