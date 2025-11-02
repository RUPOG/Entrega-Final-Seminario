extends AnimationPlayer

var en_mundo_real:bool
var en_mundo_neutro : bool

func cambio_mundo_neutro():
	if !en_mundo_neutro:
		play("cambio_mundo_neutro")
		print("cambió a mundo neutro")
		en_mundo_neutro = true
		en_mundo_real = false

func cambio_mundo_real():
	if !en_mundo_real:
		play("cambio_mundo_real")
		print("cambió a mundo real")
		en_mundo_real = true
		en_mundo_neutro = false


func _input(event: InputEvent) -> void:
	if event.is_action("abajo"):
		cambio_mundo_real()
	elif event.is_action("arriba"):
		cambio_mundo_real()
	elif event.is_action("izquierda"):
		cambio_mundo_real()
	elif event.is_action("derecha"):
		cambio_mundo_real()
