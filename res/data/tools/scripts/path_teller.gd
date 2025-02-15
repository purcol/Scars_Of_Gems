extends Path2D

@export var is_loop := true

func _ready() -> void:
	$"../Path/Follow".loop = is_loop
	$"../Path".curve = curve
	if is_loop:
		curve.add_point(Vector2(0,0))
	#queue_free()
	
