extends Node2D

@export var speed:float = 0.1
var old_p4 = 0
var offset := 0
var target_rot := 0
@onready var target = $"../../Sprite_Component"

func _process(_delta: float) -> void:
	if old_p4 == G.step_p4:
		pass
	else:
		#flag = true
		old_p4 = G.step_p4
		if offset > 3: offset = offset%3
		var new_p4 = old_p4+offset
		print(new_p4)
		if new_p4 > 3: new_p4 = new_p4%3
		print(offset,"|",new_p4,"|",old_p4)
		toglle_colision(new_p4)
		rotate_door()

		#бебаг:
		#print("| rot ", roundi($"../../..".rotation_degrees), "\n| ini ", roundi(init_rotation), "\n| sum ", roundi((old_p4*90)+init_rotation), "\n| min ", roundi((old_p4*90)+init_rotation-$"../../..".rotation_degrees), "\n|", old_p4, "\n")

func toglle_colision(_p4)->void:
	if _p4 != 3:
		get_node("../../Area_Component"+str(_p4+1)+"/colosion_teller").disabled = false
	else:
		get_node("../../Area_Component"+str(0)+"/colosion_teller").disabled = false
	get_node("../../Area_Component"+str(_p4)+"/colosion_teller").disabled = true

func rotate_door() -> void:
	if !$"../../Area_Component0/colosion_teller".disabled:
		get_tree().create_tween().tween_property(target, "rotation_degrees", -90, speed)
		#target.rotation_degrees = -90
	elif !$"../../Area_Component1/colosion_teller".disabled:
		get_tree().create_tween().tween_property(target, "rotation_degrees", 0, speed)
	elif !$"../../Area_Component2/colosion_teller".disabled:
		get_tree().create_tween().tween_property(target, "rotation_degrees", 90, speed)
	elif !$"../../Area_Component3/colosion_teller".disabled:
		get_tree().create_tween().tween_property(target, "rotation_degrees", 180, speed)
	print(target.rotation_degrees)
	#if $"../../..".reverse:
		#target_rot = target.rotation_degrees-90
		#get_tree().create_tween().tween_property(target, "rotation_degrees", target_rot, speed)
	#else:
		#target_rot = target.rotation_degrees+90
		#get_tree().create_tween().tween_property(target, "rotation_degrees", target_rot, speed)

func waited_list_effect() -> void:
	#offset += 1
	#if offset > 3: offset = offset%3
	var new_p4 = old_p4+offset
	#print(new_p4)
	#if new_p4 > 3: new_p4 = new_p4%3
	#print(offset,"|",new_p4,"|",old_p4)
	
	toglle_colision(new_p4)
	rotate_door()

func _on_area_component_0_body_exited(_body: Node2D) -> void:
	G.in_movement_ignore_zone = false

func _on_area_component_1_body_exited(_body: Node2D) -> void:
	G.in_movement_ignore_zone = false

func _on_area_component_2_body_exited(_body: Node2D) -> void:
	G.in_movement_ignore_zone = false

func _on_area_component_3_body_exited(_body: Node2D) -> void:
	G.in_movement_ignore_zone = false


func _on_area_component_0_body_entered(_body: Node2D) -> void:
	G.in_movement_ignore_zone = true
	if G.waited_list.is_empty():
		G.waited_list.append([Vector2(0,-1),get_path()])

func _on_area_component_1_body_entered(_body: Node2D) -> void:
	G.in_movement_ignore_zone = true
	if G.waited_list.is_empty():
		G.waited_list.append([Vector2(-1,0),get_path()])

func _on_area_component_2_body_entered(_body: Node2D) -> void:
	G.in_movement_ignore_zone = true
	if G.waited_list.is_empty():
		G.waited_list.append([Vector2(0,-1),get_path()])

func _on_area_component_3_body_entered(_body: Node2D) -> void:
	G.in_movement_ignore_zone = true
	if G.waited_list.is_empty():
		G.waited_list.append([Vector2(1,0),get_path()])
