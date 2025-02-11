extends CharacterBody2D

var speed:float
var mov_stuck := false

var ver_mov := false
var hor_mov := false

var idel_anim := "simple_idel"

@export var collision_size := Vector2i(11,2)
@export var st_speed := 300.0

@export var use_animations := true
@export var use_keys := true
## влево | вправо | вверх | вниз | деш
@export var keys:Array[String] = ["ui_left", "ui_right", "ui_up", "ui_down"]
@export var bonus_keys:Array[String] = ["input_dash"]

func _physics_process(_delta: float) -> void:
	if use_keys:
		movment(Input.get_axis(keys[0], keys[1]),Input.get_axis(keys[2], keys[3]))
		if Input.is_action_just_pressed(bonus_keys[0]) and $"..".has_node("Dash_comp"):
			$"../Dash_comp".start_dash()
	move_and_slide()

func _ready() -> void:
	if collision_size != Vector2i(0,0):
		$"../../Collision".shape.size = collision_size

func bugs():
	if $"../..".velocity.x + $"../..".velocity.y > 7500:
		$"../..".velocity.x /= 15
		$"../..".velocity.y /= 15

func vertical_movment(direction) -> void:
	if direction:
		$"../..".velocity.y = direction * speed
		ver_mov = true
	else:
		$"../..".velocity.y = move_toward($"../..".velocity.y, 0, speed*0.15)
		ver_mov = false

func horisontal_movment(direction) -> void:
	if direction:
		$"../..".velocity.x = direction * speed
		hor_mov = true
	else:
		$"../..".velocity.x = move_toward($"../..".velocity.x, 0, speed*0.15)
		hor_mov = false

func sprite_chenge(direction_x, direction_y) -> void:
	if mov_stuck:
		if direction_x > 0 and direction_y < 0:
			$"../../Sprite".play("dash_up")
		elif direction_x > 0 and direction_y > 0:
			$"../../Sprite".play("dash_down")
		elif direction_x < 0 and direction_y < 0:
			$"../../Sprite".play("dash_up")
		elif direction_x < 0 and direction_y > 0:
			$"../../Sprite".play("dash_down")
		elif direction_x > 0:
			$"../../Sprite".play("dash_right")
		elif direction_x < 0:
			$"../../Sprite".play("dash_left")
		elif direction_y > 0:
			$"../../Sprite".play("dash_down")
		elif direction_y < 0:
			$"../../Sprite".play("dash_up")
		else:
			$"../../Sprite".play("simple_idel")
		return
		
	if !direction_x and !direction_y:
		$"../../Sprite".play(idel_anim)
	else:
		if direction_x > 0 and direction_y < 0:
			$"../../Sprite".play("walk_up")
		elif direction_x > 0 and direction_y > 0:
			$"../../Sprite".play("walk_down")
		elif direction_x < 0 and direction_y < 0:
			$"../../Sprite".play("walk_up")
		elif direction_x < 0 and direction_y > 0:
			$"../../Sprite".play("walk_down")
		elif direction_x > 0:
			$"../../Sprite".play("walk_right")
		elif direction_x < 0:
			$"../../Sprite".play("walk_left")
		elif direction_y > 0:
			$"../../Sprite".play("walk_down")
		elif direction_y < 0:
			$"../../Sprite".play("walk_up")

func movment(direction_x, direction_y) -> void:
	if !mov_stuck:
		horisontal_movment(direction_x)
		vertical_movment(direction_y)
		if ver_mov and hor_mov:
			$"../..".velocity /= 1.35
	else:
		if $"../..".velocity.x !=0:
			$"../..".velocity.x = speed * direction_x
		if $"../..".velocity.y !=0:
			$"../..".velocity.y = speed * direction_y
	if use_animations:
		sprite_chenge(direction_x, direction_y)
