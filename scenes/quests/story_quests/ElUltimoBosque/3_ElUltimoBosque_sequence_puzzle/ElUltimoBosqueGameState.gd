extends "res://scenes/globals/game_state/game_state.gd"
class_name ElUltimoBosqueGameState

# 👇 Señales adicionales separadas por tipo
signal personaje_item_collected(item: ElUltimoBosquePersonajeItem)
signal objeto_item_collected(item: ElUltimoBosqueObjetoInventoryItem)

func add_collected_item(item: InventoryItem) -> void:
	# ✅ Evitar duplicados del mismo tipo
	for existing_item in story_quest_inventory.get_items():
		if existing_item.same_type_as(item):
			print("🚫 Ya existe un ítem del mismo tipo:", item)
			return

	# 👌 Llamamos al padre para hacer la lógica base
	super.add_collected_item(item)
	print("✅ Ítem nuevo agregado:", item)

	# 🧠 Emitimos señales personalizadas según tipo
	if item is ElUltimoBosquePersonajeItem:
		personaje_item_collected.emit(item)
	elif item is ElUltimoBosqueObjetoInventoryItem:
		objeto_item_collected.emit(item)
