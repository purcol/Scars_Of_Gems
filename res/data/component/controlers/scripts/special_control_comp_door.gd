extends Node2D

@export var speed:float = 0.1
var old_p4 = 0
#var flag:bool = false
var target_rot := 0
@onready var target = $"../../Sprite_Component"

func _process(_delta: float) -> void:
	if old_p4 == G.step_p4:
		pass
	else:
		#flag = true
		old_p4 = G.step_p4
		if old_p4 != 3:
			get_node("../../Area_Component"+str(old_p4+1)+"/colosion_teller").disabled = false
		else:
			get_node("../../Area_Component"+str(0)+"/colosion_teller").disabled = false
		get_node("../../Area_Component"+str(old_p4)+"/colosion_teller").disabled = true
		if $"../../..".reverse:
			target_rot = target.rotation_degrees-90
			get_tree().create_tween().tween_property(target, "rotation_degrees", target_rot, speed)
		else:
			target_rot = target.rotation_degrees+90
			get_tree().create_tween().tween_property(target, "rotation_degrees", target_rot, speed)

		#бебаг:
		#print("| rot ", roundi($"../../..".rotation_degrees), "\n| ini ", roundi(init_rotation), "\n| sum ", roundi((old_p4*90)+init_rotation), "\n| min ", roundi((old_p4*90)+init_rotation-$"../../..".rotation_degrees), "\n|", old_p4, "\n")


func _on_area_component_body_entered(body: Node2D) -> void:
	pass
	#if body.name == "PlayerEntity":
		#match old_p4:
			#0:
				#get_tree().create_tween().tween_property(body, "position", 
				#Vector2(body.position.x-16, body.position.y), 0.2)
			#1:
				#get_tree().create_tween().tween_property(body, "position", 
				#Vector2(body.position.x, body.position.y+16), 0.2)
			#2:
				#get_tree().create_tween().tween_property(body, "position", 
				#Vector2(body.position.x, body.position.y), 0.2)
			#3:
				#get_tree().create_tween().tween_property(body, "position", 
				#Vector2(body.position.x, body.position.y-16), 0.2)

func _on_area_component_0_body_exited(body: Node2D) -> void:
	G.waited_list.append(Vector2(-1,1))

func _on_area_component_1_body_exited(body: Node2D) -> void:
	G.waited_list.append(Vector2(-1,-1))

func _on_area_component_2_body_exited(body: Node2D) -> void:
	G.waited_list.append(Vector2(1,-1))

func _on_area_component_3_body_exited(body: Node2D) -> void:
	G.waited_list.append(Vector2(1,1))
