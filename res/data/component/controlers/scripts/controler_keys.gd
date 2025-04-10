extends Node2D

@export var keys:Array[String] = ["ui_left", "ui_right", "ui_up", "ui_down"]
@export var SPEED := 0.1
@export var ignore_colision_tag:Array[String] = ["StarShardEentity"]
var velocity := Vector2.ZERO
var flag := false
var can_wallk:Array[bool] = []

func  _physics_process(_delta: float) -> void:
	can_wallk = update_avalible_diractions()
	if !G.in_movement_ignore_zone:
		movment(Input.get_axis(keys[0], keys[1]),Input.get_axis(keys[2], keys[3]))
	else:
		#print(Input.get_axis(keys[2], keys[3]),Input.get_axis(keys[0], keys[1]))
		if (Input.get_axis(keys[0], keys[1]) !=0) or (Input.get_axis(keys[2], keys[3]) !=0):
			if !flag:
				for i in G.waited_list:
					G.print_debug_mode(["Лист ожидания: ",G.waited_list],self.get_path())
					move(i.x,i.y,false)
					G.waited_list.erase(i)
					await get_tree().create_timer(0.3).timeout
					flag = false
	$"..".velocity = velocity

func movment(direction_x, direction_y) -> void:
	if flag:
		pass
	else:
		if direction_x != 0:
			if direction_x > 0: 
				if can_wallk[0]:
					move(direction_x, 0)
			else:
				if can_wallk[1]:
					move(direction_x, 0)
		elif direction_y != 0:
			if direction_y > 0: 
				if can_wallk[3]:
					move(0, direction_y)
			else: 
				if can_wallk[2]:
					move(0, direction_y)
		if flag:
			await get_tree().create_timer(0.3).timeout
			flag = false
	$"..".sprite_chenge(direction_x, direction_y)

func move(direction_x:float = 0, direction_y:float = 0, update:bool = true) -> void:
	get_tree().create_tween().tween_property($"../../..", "position", 
	Vector2(
		(($"../../..".position.x)+16*direction_x),
		(($"../../..".position.y)+16*direction_y)
		)
	,SPEED
	)
	if update:
		G.steps += 1
		G.step_history.append([position.x/16,position.y/16])
	flag = true
	
func update_avalible_diractions() -> Array[bool]:
	var dir:Array[bool] = []
	if ($"../../RayCast_Component_right".get_collider() 
	and !$"../../RayCast_Component_right".get_collider().get_node("../../").name in ignore_colision_tag
	and !$"../../RayCast_Component_right".get_collider().get_node("../").has_node("Controler_Component/ControlCompKnockbacker")):
		
		dir.append(false)
	else:
		dir.append(true)
	if ($"../../RayCast_Component_left".get_collider()
	and !$"../../RayCast_Component_left".get_collider().get_node("../../").name in ignore_colision_tag
	and !$"../../RayCast_Component_left".get_collider().get_node("../").has_node("Controler_Component/ControlCompKnockbacker")):
		
		dir.append(false)
	else:
		dir.append(true)
	if ($"../../RayCast_Component_up".get_collider()
	and !$"../../RayCast_Component_up".get_collider().get_node("../../").name in ignore_colision_tag
	and !$"../../RayCast_Component_up".get_collider().get_node("../").has_node("Controler_Component/ControlCompKnockbacker")):
		
		dir.append(false)
	else:
		dir.append(true)
	if ($"../../RayCast_Component_down".get_collider()
	and !$"../../RayCast_Component_down".get_collider().get_node("../../").name in ignore_colision_tag
	and !$"../../RayCast_Component_down".get_collider().get_node("../").has_node("Controler_Component/ControlCompKnockbacker")):
		
		dir.append(false)
	else:
		dir.append(true)
	#if $"../../RayCast_Component_right".get_collider():
		#print($"../../RayCast_Component_right".get_collider().get_node("../../").name)
	return dir
