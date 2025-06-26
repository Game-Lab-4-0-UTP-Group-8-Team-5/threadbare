extends "res://scenes/quests/story_quests/props/collectible_item/components/collectible_item.gd"
class_name ElUltimoBosqueObjetoCollectibleItem
#ES DE PERSONAJE
func _ready() -> void:
	super._ready()
	if not GameState.item_collected.is_connected(_on_item_recolectado):
		GameState.item_collected.connect(_on_item_recolectado)

func _on_item_recolectado(collected_item: InventoryItem) -> void:
	print("🟡 Recolectado:", collected_item)
	print("🟡 Item en escena:", item)
	print("🟡 Mismo item?", collected_item == item)
	print("🟡 Es objeto?", collected_item is ElUltimoBosqueObjetoInventoryItem)
	print("🟡 Es personaje?", collected_item is ElUltimoBosquePersonajeItem)

	if collected_item == item and (
		collected_item is ElUltimoBosqueObjetoInventoryItem or
		collected_item is ElUltimoBosquePersonajeItem
	):
		var hud := get_tree().get_first_node_in_group("HUD")
		if hud:
			hud.agregar_objeto(collected_item)
			print("🧩 Personaje agregado al HUD:", collected_item)
	else:
		print("❌ No pasó la condición. Se agregó al HUD OBJETOS.")
