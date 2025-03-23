extends Node2D

var step_p4:int = 0
var steps := 0 : set = set_p4
var step_history:Array[Array] = [[0.0,0.0]]
var restart_timer:int = 0
var in_movement_ignore_zone:bool = false
## лист ожидания для move
var waited_list:Array[Vector2] = []

func set_p4(_value):
	if step_p4 <3:
		step_p4 += 1
	else:
		step_p4 = 0

func restart_chec() -> void:
	if Input.is_action_pressed("reload_action"):
		restart_timer += 1
		if restart_timer >= 100:
			get_tree().reload_current_scene()
			steps = 0
			step_p4 = 0
			step_history = []
			restart_timer = 0
	else:
		if restart_timer > 0:
			restart_timer -= 1

func _process(_delta: float) -> void:
	restart_chec()
