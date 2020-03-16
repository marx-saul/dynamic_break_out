extends Node

export (PackedScene) var Block;

func _ready():
	var block = Block.instance();
	block.init(100, 100, 100, 10);
	add_child(block);


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
