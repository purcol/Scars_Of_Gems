extends Sprite2D

@export var special_sprites:Array[ImageTexture]

func get_spesial_sprites() -> Array:
	return special_sprites

func add_spesial_sprite(sprite:ImageTexture) -> void:
	special_sprites.append(sprite)

func set_special_sprites(new_special_sprites:Array[ImageTexture]) -> void:
	special_sprites = new_special_sprites

func pop_special_sprites(index:int) -> ImageTexture:
	var del_sp = special_sprites[index]
	special_sprites.remove_at(index)
	return del_sp
