extends Node

var progress:float = 0

func _process(_delta: float) -> void:
	if $"../../../../Player".velocity != Vector2.ZERO:
		progress += 1
		$"..".progress = progress
