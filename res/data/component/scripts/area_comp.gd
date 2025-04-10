extends Area2D

@export var id:int = 0

#func _on_body_exited(body: Node2D) -> void:
#	if body.name == "Player":
#		$"../control_comp".run_control(1)

func _on_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body.name == "PlayerEntity":
		#if FileAccess.file_exists("res://res/data/level_packs/"+G.current_pack+"/"+str(G.current_level)+".tscn"):
			#get_tree().call_deferred("change_scene_to_file", "res://res/data/level_packs/"+G.current_pack+"/"+str(G.current_level)+".tscn")
		#else:
			#G.win = true
			#get_tree().call_deferred("change_scene_to_file", "res://res/data/gui/main_menu.tscn")\
		
		##Я вас уверяю здесь был нормальный код, а не этот кусок условия
		var flag = false
		if G.current_pack == "standart":
			if G.current_level == 1:
				flag = true
				get_tree().call_deferred("change_scene_to_file", "res://res/data/level_packs/standart/1.tscn")
		else:
			if G.current_level == 1:
				flag = true
				get_tree().call_deferred("change_scene_to_file", "res://res/data/level_packs/tutorial/1.tscn")
			if G.current_level == 2:
				flag = true
				get_tree().call_deferred("change_scene_to_file", "res://res/data/level_packs/tutorial/2.tscn")
			if G.current_level == 3:
				flag = true
				get_tree().call_deferred("change_scene_to_file", "res://res/data/level_packs/tutorial/3.tscn")
		if !flag:
			G.current_level = 0
			get_tree().call_deferred("change_scene_to_file", "res://res/data/gui/main_menu.tscn")
