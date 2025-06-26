extends Area2D
@export var objeto_id: int = 0  # Por si quieres diferenciar

signal objeto_recolectado

func _ready():
	connect("body_entered", _on_body_entered)

func _on_body_entered(body):
	if body.name == "Dante":  # Ajusta al nombre real del jugador
		objeto_recolectado.emit()
		queue_free()  # Elimina el objeto de la escena
