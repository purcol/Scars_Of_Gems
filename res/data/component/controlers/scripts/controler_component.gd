extends Node2D

@export var _static:bool = false
var velocity:Vector2 = Vector2(0,0)

func _physics_process(_delta: float) -> void:
	if !_static:
		$"../..".velocity = velocity
		$"../..".move_and_slide()

func sprite_chenge(direction_x, direction_y) -> void:
	if !$"../Animated_Sprite_Component":
		pass
	elif $"../..".name == "PlayerEntity":
		var sprite = $"../Animated_Sprite_Component"
		if !direction_x and !direction_y:
			sprite.play(sprite.idel_anim)
		else:
			if direction_x > 0 and direction_y < 0:
				sprite.play("walk_up")
			elif direction_x > 0 and direction_y > 0:
				sprite.play("walk_down")
			elif direction_x < 0 and direction_y < 0:
				sprite.play("walk_up")
			elif direction_x < 0 and direction_y > 0:
				sprite.play("walk_down")
			elif direction_x > 0:
				sprite.play("walk_right")
			elif direction_x < 0:
				sprite.play("walk_left")
			elif direction_y > 0:
				sprite.play("walk_down")
			elif direction_y < 0:
				sprite.play("walk_up")
