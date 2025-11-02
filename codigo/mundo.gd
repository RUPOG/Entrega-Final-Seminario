extends Node2D

const ORBE_EMISOR = preload("res://Escenas/orbe_emisor.tscn")

const FF0 = preload("res://Recursos/forceField_000.ogg")
const FF1 = preload("res://Recursos/forceField_001.ogg")
const FF2 = preload("res://Recursos/forceField_002.ogg")
const FF3 = preload("res://Recursos/forceField_003.ogg")
@onready var sonidos: Array = [FF0,FF1,FF2,FF3]
@onready var nota: AudioStreamPlayer = $Nota
@onready var cant_orbes_max: int = 4

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused = !get_tree().paused

func chequear_orbes(num : int) -> void:
	if num == cant_orbes_max:
		#acá se termina el juego
		pass
