extends Node2D

@export var speed:float = 1.0
@onready var init_rotation = $"../../..".rotation

func _process(_delta: float) -> void:
	if $"../../..".reverse:
		$"../../../".rotation = -(speed*($"../".progress*0.01)) + init_rotation
	else:
		$"../../../".rotation = speed*($"../".progress*0.01) + init_rotation
