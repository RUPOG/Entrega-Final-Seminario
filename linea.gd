extends Line2D

func crear_segmentos_area2d() -> void:
	var contador = 0
	for p in points:
		var area = Area2D.new()
		area as Area2D
		var forma_colision = CollisionShape2D.new()
		forma_colision.shape = SegmentShape2D.new()
		forma_colision.shape.b = points[contador]
		if contador == 0:
			forma_colision.shape.a = Vector2.ZERO
		else:
			forma_colision.shape.a = points[contador-1]
		add_child(area)
		area.add_child(forma_colision)
		contador += 1 

func crear_camino(posicion_final: Vector2= Vector2(1000,1000), cantidad_segmentos: int = 7) -> void:
	for s in cantidad_segmentos:
		if points.is_empty():
			add_point(Vector2.ZERO)
			continue
		var test = posicion_final / cantidad_segmentos
		var variacion_x = randf_range(-100.0, 200.0)
		var variacion_y = randf_range(-100.0, 200.0)
		var vector_variable =Vector2(points[s-1].x + variacion_x + test.x,  points[s-1].y + variacion_y + test.y) 
		add_point(vector_variable)
