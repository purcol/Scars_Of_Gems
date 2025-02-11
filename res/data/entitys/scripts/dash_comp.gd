extends Node2D

@onready var movement := $"../Movement_comp"

@export var dash_time:float = 0.1
@export var dash_speed:float = 4
var in_dash:bool = false

func _process(_delta: float) -> void:
	if in_dash:
		#$"../..".set_collision_layer(2)
		movement.speed = movement.st_speed * dash_speed
		movement.mov_stuck = true
	else:
		#$"../..".set_collision_layer(1)
		movement.speed = movement.st_speed
		movement.mov_stuck = false

func start_dash() -> void:
	in_dash = true
	$Timer.start(dash_time)
	create_effect()

func _on_timer_timeout() -> void:
	in_dash = false

func create_effect():
	pass
	
	#var dash_effect = load("res://res/assets/component/dash_effect.tscn").instantiate()
	#dash_effect.global_position = $"../..".global_position
	#var root := get_tree().root
	#
	#while in_dash:
		#dash_effect.global_position = $"../..".global_position
		#if !root.get_node("./Node2D").has_node("DashEffect"):
			#await get_tree().create_timer(0.1).timeout
			#root.get_node("./Node2D").add_child(dash_effect)
			#print("POS:"+str(dash_effect.global_position))
