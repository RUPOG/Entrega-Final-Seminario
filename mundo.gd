extends Node2D

const ORBE_EMISOR = preload("res://Escenas/orbe_emisor.tscn")

const FF0 = preload("res://Recursos/forceField_000.ogg")
const FF1 = preload("res://Recursos/forceField_001.ogg")
const FF2 = preload("res://Recursos/forceField_002.ogg")
const FF3 = preload("res://Recursos/forceField_003.ogg")
@onready var sonidos: Array = [FF0,FF1,FF2,FF3]
@onready var nota: AudioStreamPlayer = $Nota

func _ready() -> void:
	inicializar_emisores()



func inicializar_emisores() -> void:
	var cuadrante : int = 0
	for s in sonidos:
		var instancia_orbe = ORBE_EMISOR.instantiate()
		add_child(instancia_orbe)
		match  cuadrante:
			0:
				instancia_orbe.position = Vector2(-2000,-2000)
			1:
				instancia_orbe.position = Vector2(2000,-2000)
			2:
				instancia_orbe.position = Vector2(-2000,2000)
			3:
				instancia_orbe.position = Vector2(2000,2000)
		instancia_orbe.area_agarrable.connect("body_entered",nota.play.unbind(1))
		instancia_orbe.sonido_cerca.volume_db = -30.0
		instancia_orbe.sonido_lejos.stream = s
		instancia_orbe.sonido_lejos.play()
		cuadrante += 1
