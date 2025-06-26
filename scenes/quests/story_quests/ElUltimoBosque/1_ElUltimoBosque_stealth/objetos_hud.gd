# ElUltimoBosqueHUDObjetos.gd
extends CanvasLayer
class_name ElUltimoBosqueHUDObjetos

@onready var items_container: HBoxContainer = $PanelContainer/ItemsContainer_Objetos
var objetos_mostrados: Array[InventoryItem] = []
signal todos_objetos_recolectados

func _ready() -> void:
	add_to_group("HUDObjetos")
func agregar_objeto(item: InventoryItem) -> void:
	if item is ElUltimoBosqueObjetoInventoryItem:  # 👈 Este tipo es exclusivo para objetos
		# Ya fue agregado
		if objetos_mostrados.any(func(i): return i.same_type_as(item)):
			return

		# Mostrar en HUD
		var icon := TextureRect.new()
		icon.texture = item.get_world_texture()
		icon.custom_minimum_size = Vector2(64, 64)
		icon.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
		items_container.add_child(icon)

		objetos_mostrados.append(item)
		print("🎒 Objeto agregado al HUD de objetos:", item)

		if objetos_mostrados.size() >= 3:
			emit_signal("todos_objetos_recolectados")
	else:
		print("❌ Este ítem NO es objeto, no se agregará al HUD objetos:", item)
