extends Path2D

@export var area:Vector2 = Vector2(1,1)
@export var is_loop := true

@export var moving:bool = false
var procent:int = 0

##Задаёт колизию
func set_area(area:Vector2=Vector2(1,1)):
	$Area/Collision.shape.size = Vector2(16*area[0],16*area[1])

func get_area():
	return Vector2($Area/Collision.shape.size.x/16,$Area/Collision.shape.size.y/16)

##Задаёт путь
func set_path(path:Curve2D):
	curve = path

func get_mvement_path():
	return curve


func _ready() -> void:
	$MovementPath.loop = is_loop

func _process(_delta: float) -> void:
	if moving:
		$MovementPath.progress_ratio = procent*0.01
		procent += 1
