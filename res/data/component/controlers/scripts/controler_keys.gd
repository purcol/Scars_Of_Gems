extends Node2D

@export var keys:Array[String] = ["ui_left", "ui_right", "ui_up", "ui_down"]
var velocity := Vector2(0,0)
var idel_anim := "simple_idel"
var ver_mov := false
var hor_mov := false

const SPEED = 200

func  _physics_process(_delta: float) -> void:
	movment(Input.get_axis(keys[0], keys[1]),Input.get_axis(keys[2], keys[3]))
	$"..".velocity = velocity

func movment(direction_x, direction_y) -> void:
	horisontal_movment(direction_x)
	vertical_movment(direction_y)
	bugs()
	$"..".sprite_chenge(direction_x, direction_y)

func bugs():
	if velocity.x + velocity.y > 7500:
		velocity.x /= 15
		velocity.y /= 15

func vertical_movment(direction) -> void:
	if direction:
		ver_mov = true
		velocity.y = direction * SPEED
	else:
		ver_mov = false
		velocity.y = move_toward(velocity.y, 0, SPEED*0.15)

func horisontal_movment(direction) -> void:
	if direction:
		velocity.x = direction * SPEED
		hor_mov = true
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED*0.15)
		hor_mov = false
