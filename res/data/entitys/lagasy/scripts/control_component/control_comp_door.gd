extends Node2D

@export var speed:float = 1.0
var progress:float = 1

func _process(_delta: float) -> void:
	if $"../../..".reverse:
		$"../../../TileMap".rotation = -(speed*(progress*0.01))
	else:
		$"../../../TileMap".rotation = speed*(progress*0.01)
