extends Node2D

@onready var node_2d: Line2D = $Node2D
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

@export var audio : AudioStream
@export var posicion_final: Vector2

func _ready() -> void:
	audio_stream_player_2d.stream = audio
	audio_stream_player_2d.autoplay = true
	print(audio_stream_player_2d.global_position)
	node_2d.crear_segmentos_area2d()
	node_2d.crear_conexion(posicion_final)
