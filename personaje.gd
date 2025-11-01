extends CharacterBody2D
class_name jugador

signal agarre_orbe(num:int)
@export var VELOCIDAD: float = 100
@onready var timer_quieto: Timer = $TimerQuieto
@onready var pasos: AudioStreamPlayer = $Pasos
@onready var cant_orbes: int = 0

const FRENADO: float = 600
var moviendose: bool = false



func _physics_process(delta: float) -> void:
	movimiento(delta)


func movimiento(delta):
	var direccion: Vector2 = Input.get_vector("izquierda","derecha","arriba","abajo")
	if direccion:
		moviendose = true
		velocity = direccion * VELOCIDAD
		if !pasos.playing:
			pasos.play()
			timer_quieto.stop()
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRENADO * delta)
		if moviendose: 
			moviendose = false
			print(moviendose)
			timer_quieto.start()
	
	move_and_slide()


func sumarOrbe():
	cant_orbes += 1
	agarre_orbe.emit(cant_orbes)
