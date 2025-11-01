extends Area2D
@onready var radio_colision: float = $CollisionShape2D.shape.radius
@onready var sonido_cerca: AudioStreamPlayer2D = $SonidoCercano
@onready var sonido_lejos: AudioStreamPlayer2D = $SonidoLejos
@onready var area_agarrable: Area2D = $AreaAgarrable



var player_ref: Node2D 
var player_cerca: bool = false

func _ready() -> void:
	connect("body_entered", emitir_sonido_cercano)
	connect("body_exited", apagar_sonido_cercano.unbind(1))
	area_agarrable.connect("body_entered", queue_free.unbind(1))
	sonido_cerca.volume_db = -100.0

func _process(delta: float) -> void:
	if player_cerca:
		sonido_cerca.pitch_scale = distancia_en_area(position, radio_colision, player_ref.position ) + 1 # el uno es para que la frecuencia sea un poco mas rápida

func emitir_sonido_cercano(body:Node2D) -> void:
	player_ref = body
	sonido_cerca.volume_db = -30.0
	player_cerca = true

func apagar_sonido_cercano() -> void:
	sonido_cerca.volume_db = -100.0
	player_cerca = false

# Se utiliza para señalar que tan cerca está player del centro del radio 
func distancia_en_area(centro: Vector2, radio: float, pos: Vector2) -> float:
	var distancia = centro.distance_to(pos)
	var porcentaje = 1.0 - (distancia / radio) 
	return clamp(porcentaje, 0.0, 1.0)
