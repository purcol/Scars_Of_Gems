extends Node2D

@export var speed:float = 1.0

func _process(_delta: float) -> void:
	$"../../../Path/Follow".progress_ratio = speed*($"../".progress*0.01)
