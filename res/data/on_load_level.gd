extends Node2D

func _ready() -> void:
	print(G.current_level)
	print_debug(G.current_level," | ",G.current_level+1, " | ",FileAccess.file_exists("res://res/data/level_packs/"+G.current_pack+"/"+str(G.current_level+1)+".tscn"))
	G.current_level += 1
	G.reset()
