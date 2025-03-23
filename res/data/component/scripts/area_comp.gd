extends Area2D

@export var id:int = 0

#func _on_body_exited(body: Node2D) -> void:
#	if body.name == "Player":
#		$"../control_comp".run_control(1)

func _on_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body.name == "PlayerEntity":
		print(name)
		get_tree().call_deferred("change_scene_to_file", "res://res/data/level_packs/dev/level_end_plaseholder.tscn")
