extends CharacterBody2D

var can_dahs:bool = true

func _physics_process(_delta: float) -> void:
	#print(str(Engine.get_frames_per_second()) +"|"+ str(velocity.x) +"|"+ str(velocity.y) +"|"+ str(velocity.x+velocity.y)+"|"+ str($Components/Movement_comp.speed)+"|"+ $Components/Movement_comp.idel_anim)
	move_and_slide()
	
func _on_sprite_animation_looped() -> void:
	if $Components/Movement_comp.idel_anim != "simple_idel":
		$Components/Movement_comp.idel_anim = "simple_idel"
	if randi_range(0,10) == 0:
		$Components/Movement_comp.idel_anim = "song_idel"
	else:
		$Components/Movement_comp.idel_anim = "simple_idel"
