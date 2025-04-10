extends Node2D

var step_p4:int = 0
var steps := 0 : set = set_p4
var step_history:Array[Array] = [[0.0,0.0]]
var restart_timer:int = 0
var in_movement_ignore_zone:bool = false
## лист ожидания для move  [[Vector2,NodePath]]
var waited_list:Array = []
var win = false
@export var current_pack:String = "tutorial"
@export var current_level:int = 0

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
			current_level -= 1
			restart_timer = 0
	else:
		if restart_timer > 0:
			restart_timer -= 1

func reset()->void:
	steps = 0
	step_p4 = 0
	step_history = []
	restart_timer = 0

func _process(_delta: float) -> void:
	restart_chec()
	if Input.is_action_just_released("fullscren"):
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
