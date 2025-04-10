extends Node2D

func _ready() -> void:
	G.print_debug_mode(["Текущий уровень: ",G.current_level,
	"\n | Следуйщий уровень: ",G.current_level+1, 
	"\n | Файл следуйщего уровня: ",FileAccess.file_exists("res://res/data/level_packs/"+G.current_pack+"/"+str(G.current_level+1)+".tscn")],self.get_path())
	G.current_level += 1
	G.reset()
