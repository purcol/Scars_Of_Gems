extends Node2D

@onready var target = $"../../Sprite_Component"
var angle:Vector2 = Vector2.ZERO
@export var a:StringName

func update() -> void:
	var deg = roundi($"../../..".rotation_degrees)
	G.print_debug_mode(["Поворот ",$"../../..".name,": ",$"../../..".rotation_degrees],self.get_path())
	if deg == 0:
		angle = Vector2(1,0)
	elif deg == 90:
		angle = Vector2(0,1)
	elif deg == 180:
		angle = Vector2(-1,0)
	elif deg == 270:
		angle = Vector2(0,-1)
	else:
		#print_debug("+error at "+$"../../..".name+" | ",$"../../..".rotation_degrees," | ",deg)
		if deg == -90:
			angle = Vector2(0,-1)
		elif deg == -180:
			angle = Vector2(-1,0)
		elif deg == -270:
			angle = Vector2(0,1)
		else:
			angle = Vector2(0,0)
			G.print_debug_mode(["Ошибка поворота "+$"../../..".name+": Поворот в градуссах",$"../../..".rotation_degrees,"\n | Округлённый поворот: ",deg],self.get_path(),true)

func _on_area_component_0_body_exited(_body: Node2D) -> void:
	G.in_movement_ignore_zone = false

func _on_area_component_0_body_entered(_body: Node2D) -> void:
	#print("PRE ",G.waited_list)
	G.in_movement_ignore_zone = true
	update()
	if G.waited_list.is_empty():
		G.waited_list.append(angle)
		#print("POS ",G.waited_list)
