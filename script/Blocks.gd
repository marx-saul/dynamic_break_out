extends Node

export (PackedScene) var Block;

func _ready():
	for i in range(3):
		var block = Block.instance();
		block.init( 105 + 105*i, 100 + 25*i, 50, 10);
		add_child(block);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
