extends TileMap

#if Vector2i(i,j) == Vector2i(7,0):set_cell_loop(Vector2i(i,j),false,false,false,false,false,false,false,false)

func _ready() -> void:
	please_colisions_tiles(false)
	delet_colision_near_briges()

func please_colisions_tiles(hide_tilemaps:bool=false) -> void:
	if hide_tilemaps:
		$Map/ParallaxBackground/Forground.visible = false
		$Map/TileMap.visible = false
		$Map/Lamps.visible = false

	for i in range(17):
		for j in range(6):
			var cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(i,j))
			if Vector2i(i,j) == Vector2i(3,0):set_cell_loop(cords,true,false,false,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(4,0):set_cell_loop(cords,true,false,false,false,false,false,false,false)
			if Vector2i(i,j) == Vector2i(5,0):set_cell_loop(cords,true,false,true,false,false,false,false,false)
			if Vector2i(i,j) == Vector2i(6,0):set_cell_loop(cords,false,false,false,false,false,false,false,true)
			if Vector2i(i,j) == Vector2i(7,0):set_cell_loop(cords,false,true,false,false,false,false,false,false)
			if Vector2i(i,j) == Vector2i(8,0):set_cell_loop(cords,true,false,true,false,true,false,true,false)
			if Vector2i(i,j) == Vector2i(9,0):set_cell_loop(cords,true,false,false,true,false,false,true,false)
			if Vector2i(i,j) == Vector2i(10,0):set_cell_loop(cords,true,false,true,false,false,true,false,false)
			if Vector2i(i,j) == Vector2i(11,0):set_cell_loop(cords,true,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(12,0):set_cell_loop(cords,true,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(13,0):set_cell_loop(cords,true,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(15,0):set_cell_loop(cords,false,false,true,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(16,0):set_cell_loop(cords,false,false,true,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(3,1):set_cell_loop(cords,false,false,false,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(4,1):set_cell_loop(cords,false,false,false,false,false,false,false,false,false,true)
			if Vector2i(i,j) == Vector2i(5,1):set_cell_loop(cords,false,false,true,false,false,false,false,false)
			if Vector2i(i,j) == Vector2i(6,1):set_cell_loop(cords,false,false,false,false,false,true,false,false)
			if Vector2i(i,j) == Vector2i(7,1):set_cell_loop(cords,false,false,false,true,false,false,false,false)
			if Vector2i(i,j) == Vector2i(9,1):set_cell_loop(cords,false,true,false,false,true,false,true,false)
			if Vector2i(i,j) == Vector2i(10,1):set_cell_loop(cords,false,false,true,false,true,false,false,true)
			
			if Vector2i(i,j) == Vector2i(11,1):set_cell_loop(cords,false,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(11,1):set_cell_loop(cords,true,false,false,false,false,false,false,false,false,false,Vector2i(0,-1))
			
			if Vector2i(i,j) == Vector2i(12,1):set_cell_loop(cords,false,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(12,1):set_cell_loop(cords,true,false,false,false,false,false,false,false,false,false,Vector2i(0,-1))
			
			if Vector2i(i,j) == Vector2i(13,1):set_cell_loop(cords,false,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(13,1):set_cell_loop(cords,true,false,false,false,false,false,false,false,false,false,Vector2i(0,-1))
			
			if Vector2i(i,j) == Vector2i(0,2):set_cell_loop(cords,false,true,false,true,false,false,false,false)
			if Vector2i(i,j) == Vector2i(1,2):set_cell_loop(cords,false,false,false,false,false,true,false,true)
			if Vector2i(i,j) == Vector2i(2,2):set_cell_loop(cords,true,false,true,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(3,2):set_cell_loop(cords,false,false,false,false,true,false,true,false)
			if Vector2i(i,j) == Vector2i(4,2):set_cell_loop(cords,false,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(5,2):set_cell_loop(cords,false,false,true,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(10,2):set_cell_loop(cords,false,false,true,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(16,2):set_cell_loop(cords,false,false,true,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(0,3):set_cell_loop(cords,true,false,false,false,false,true,false,false)
			if Vector2i(i,j) == Vector2i(1,3):set_cell_loop(cords,true,false,false,true,false,false,false,false)
			if Vector2i(i,j) == Vector2i(2,3):set_cell_loop(cords,false,false,true,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(3,3):set_cell_loop(cords,true,false,false,false,true,false,true,false)
			if Vector2i(i,j) == Vector2i(4,3):set_cell_loop(cords,true,false,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(5,3):set_cell_loop(cords,true,false,true,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(6,3):set_cell_loop(cords,false,true,false,false,false,false,true,false)
			
			if Vector2i(i,j) == Vector2i(14,3):set_cell_loop(cords,false,false,false,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(14,3):set_cell_loop(cords,false,false,true,false,false,false,false,false,false,false,Vector2i(1,0))
			
			if Vector2i(i,j) == Vector2i(16,3):set_cell_loop(cords,false,false,true,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(0,4):set_cell_loop(cords,false,false,false,false,true,false,false,true)
			if Vector2i(i,j) == Vector2i(1,4):set_cell_loop(cords,false,true,false,false,true,false,false,false)
			if Vector2i(i,j) == Vector2i(2,4):set_cell_loop(cords,false,false,true,false,true,false,true,false)
			if Vector2i(i,j) == Vector2i(3,4):set_cell_loop(cords,true,false,false,true,false,false,true,false)
			if Vector2i(i,j) == Vector2i(4,4):set_cell_loop(cords,true,false,false,true,false,true,false,false)
			if Vector2i(i,j) == Vector2i(5,4):set_cell_loop(cords,true,false,true,false,false,true,false,false)
			if Vector2i(i,j) == Vector2i(6,4):set_cell_loop(cords,false,false,false,true,false,false,true,false)
			if Vector2i(i,j) == Vector2i(7,4):set_cell_loop(cords,false,false,true,false,false,true,false,false)
			if Vector2i(i,j) == Vector2i(8,4):set_cell_loop(cords,false,true,false,false,false,false,false,true)
			if Vector2i(i,j) == Vector2i(0,5):set_cell_loop(cords,false,true,false,true,false,false,false,true)
			if Vector2i(i,j) == Vector2i(1,5):set_cell_loop(cords,false,true,false,false,false,true,false,true)
			if Vector2i(i,j) == Vector2i(2,5):set_cell_loop(cords,false,false,false,true,false,true,false,true)
			if Vector2i(i,j) == Vector2i(3,5):set_cell_loop(cords,false,true,false,true,false,true,false,false)
			
			if Vector2i(i,j) == Vector2i(14,5):set_cell_loop(cords,false,false,false,false,false,false,true,false)
			if Vector2i(i,j) == Vector2i(14,5):set_cell_loop(cords,false,false,true,false,false,false,false,false,false,false,Vector2i(1,0))
			
			if Vector2i(i,j) == Vector2i(0,6):set_cell_loop(cords,false,true,false,true,false,true,false,false)
			if Vector2i(i,j) == Vector2i(1,6):set_cell_loop(cords,false,false,false,true,false,true,false,true)
			if Vector2i(i,j) == Vector2i(2,6):set_cell_loop(cords,false,true,false,false,false,true,false,true)
			if Vector2i(i,j) == Vector2i(3,6):set_cell_loop(cords,false,true,false,true,false,false,false,true)
			
			#Это должно быть Vector2i(14,6), но оно не работает :,) , поэтому оно просто ставит калазию под центральный тайл
			if Vector2i(i,j) == Vector2i(14,5):set_cell_loop(cords,false,false,false,false,false,false,true,false,false,false,Vector2i(0,1))
			if Vector2i(i,j) == Vector2i(14,5):set_cell_loop(cords,false,false,true,false,false,false,false,false,false,false,Vector2i(1,1))
			
			if Vector2i(i,j) == Vector2i(14,6):set_cell_loop(cords,false,false,false,false,false,false,true,false,true)
			#if Vector2i(i,j) == Vector2i(0,6):set_cell_loop(cords,false,false,false,false,false,false,false,false)
			## убирает кализию в пустых тайлах, если она там как-то появится
			if Vector2i(i,j) == Vector2i(4,1):set_cell_loop(cords,false,false,false,false,false,false,false,false,false,true)
		#delet_colision_near_briges()

##задержка между созданием колизии
var time = 0.0
##принимает координаты и стороны/углы. Если сторона/угл стоит на `true` то он поспасит колизию. Стороны/углы перечисляются по часовой стрелке.
func set_cell_loop(cords:Array[Vector2i]=[Vector2i(0,0)],up:bool=false,up_right:bool=false,right:bool=false,right_down:bool=false,down:bool=false,down_left:bool=false,left:bool=false,left_up:bool=false, debug:bool=false, empty:bool=false, vector:Vector2i=Vector2i(0,0)) -> void:
	for i in range(cords.size()):
		#await get_tree().create_timer(time).timeout
		if up and up_right and right and right_down and down and down_left and left and left_up:
			set_cell(0,cords[i],3,Vector2i(0,0))
			set_cell(1,cords[i],3,Vector2i(0,0))
			set_cell(2,cords[i],3,Vector2i(0,0))
			set_cell(3,cords[i],3,Vector2i(0,0))
			set_cell(4,cords[i],3,Vector2i(0,0))
			set_cell(5,cords[i],3,Vector2i(0,0))
			set_cell(6,cords[i],3,Vector2i(0,0))
			set_cell(7,cords[i],3,Vector2i(0,0))
		if up:
			set_cell(0,cords[i]+vector,3,Vector2i(0,7))
		#await get_tree().create_timer(time).timeout
		if up_right:
			set_cell(1,cords[i]+vector,3,Vector2i(0,8))
		#await get_tree().create_timer(time).timeout
		if right:
			set_cell(2,cords[i]+vector,3,Vector2i(1,7))
		#await get_tree().create_timer(time).timeout
		if right_down:
			set_cell(3,cords[i]+vector,3,Vector2i(1,8))
		#await get_tree().create_timer(time).timeout
		if down:
			set_cell(4,cords[i]+vector,3,Vector2i(2,7))
		#await get_tree().create_timer(time).timeout
		if down_left:
			set_cell(5,cords[i]+vector,3,Vector2i(2,8))
		#await get_tree().create_timer(time).timeout
		if left:
			set_cell(6,cords[i]+vector,3,Vector2i(3,7))
		#await get_tree().create_timer(time).timeout
		if left_up:
			set_cell(7,cords[i]+vector,3,Vector2i(3,8))
		#await get_tree().create_timer(time).timeout
		if debug:
			set_cell(7,cords[i]+vector,0,Vector2i(8,1))
		if empty:
			set_cell(0,cords[i]+vector,0,Vector2i(0,0))
			set_cell(1,cords[i]+vector,0,Vector2i(0,0))
			set_cell(2,cords[i]+vector,0,Vector2i(0,0))
			set_cell(3,cords[i]+vector,0,Vector2i(0,0))
			set_cell(4,cords[i]+vector,0,Vector2i(0,0))
			set_cell(5,cords[i]+vector,0,Vector2i(0,0))
			set_cell(6,cords[i]+vector,0,Vector2i(0,0))
			set_cell(7,cords[i]+vector,0,Vector2i(0,0))

func delet_colision_near_briges() -> void:
	var cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(11,0))
	for i in range(cords.size()):
		set_cell(2,cords[i]+Vector2i(-1,0),3,Vector2i(0,0))
	cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(13,0))
	for i in range(cords.size()):
		set_cell(6,cords[i]+Vector2i(1,0),3,Vector2i(0,0))
	cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(16,0))
	for i in range(cords.size()):
		set_cell(4,cords[i]+Vector2i(0,-1),3,Vector2i(0,0))
	cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(16,3))
	for i in range(cords.size()):
		set_cell(0,cords[i]+Vector2i(0,1),3,Vector2i(0,0))
	#cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(13,0))
	#for i in range(cords.size()):
		#set_cell(6,cords[i]+Vector2i(1,0),3,Vector2i(0,0))

	cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(11,1))
	for i in range(cords.size()):
		var x = cords[i].x
		var y = cords[i].y
		set_cell(2,Vector2i(x-2,y)+Vector2i(1,0),3,Vector2i(0,0))
		set_cell(2,Vector2i(x-2,y-1)+Vector2i(1,0),3,Vector2i(0,0))
	cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(13,1))
	for i in range(cords.size()):
		var x = cords[i].x
		var y = cords[i].y
		set_cell(6,Vector2i(x,y)+Vector2i(1,0),3,Vector2i(0,0))
		set_cell(6,Vector2i(x,y-1)+Vector2i(1,0),3,Vector2i(0,0))
	
	cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(14,3))
	for i in range(cords.size()):
		var x = cords[i].x
		var y = cords[i].y
		set_cell(4,Vector2i(x,y-1)+Vector2i(1,0),3,Vector2i(0,0))
		set_cell(4,Vector2i(x-1,y-1)+Vector2i(1,0),3,Vector2i(0,0))
	cords = $"../TileMap".get_used_cells_by_id(1, 0, Vector2i(14,6))
	for i in range(cords.size()):
		var x = cords[i].x
		var y = cords[i].y
		set_cell(0,Vector2i(x,y+1)+Vector2i(1,0),3,Vector2i(0,0))
		set_cell(0,Vector2i(x-1,y+1)+Vector2i(1,0),3,Vector2i(0,0))
