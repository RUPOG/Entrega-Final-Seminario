extends CharacterBody2D

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var sensor_paredes: AudioStreamPlayer = $Sensor_paredes


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@onready var orbes : Array 
var tocando_pared: bool = false

func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("ui_left","ui_right","ui_up","ui_down")
	if direction != Vector2.ZERO and !audio_stream_player.playing:
		audio_stream_player.play()

	velocity = direction * SPEED
	
	move_and_slide()
	velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y = move_toward(velocity.y, 0, SPEED)


func _on_area_entered(area: Area2D) -> void:
	#si es de tipo orbe agarra su id y lo guarda en orbes. 
	pass # Replace with function body.

func Interactuar_con_pared(pared):
	tocando_pared = !tocando_pared
	if tocando_pared: 
		sensor_paredes.play()
	else:
		sensor_paredes.stop()
