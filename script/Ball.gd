extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	contact_monitor = true;
	contacts_reported = 10;

func _physics_process(delta):
	var collidingList = get_colliding_bodies();
	#if (collidingList.size() > 0): print_debug("detect");
	for body in collidingList:
		# print(body);
		if (body.to_string() == "Block"):
			body.eliminate();
			break;

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
