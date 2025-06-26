# Script en tu escena principal (por ejemplo, Main.tscn)
extends Node2D

func _ready():
	var hud_objetos := get_tree().get_first_node_in_group("HUDObjetos")
	if hud_objetos:
		# Conectamos la señal del HUD al método `desbloquear` del muro
		hud_objetos.connect("todos_objetos_recolectados", Callable($MuroColision, "desbloquear"))
