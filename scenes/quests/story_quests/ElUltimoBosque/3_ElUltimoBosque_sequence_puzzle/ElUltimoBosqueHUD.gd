extends "res://scenes/ui_elements/hud/components/hud.gd"
class_name ElUltimoBosqueHUD

var items_mostrados: Array[InventoryItem] = []

@onready var items_container := story_quest_progress.get_node("ItemsContainer")

func _ready() -> void:
	GameState.collected_items_changed.connect(_on_collected_items_changed)

func _on_collected_items_changed(updated_items: Array[InventoryItem]) -> void:
	# 🔍 Verificar qué tipo de ítems están llegando
	for i in updated_items:
		print("🧪 Revisando ítem:", i, "¿Es personaje?", i is ElUltimoBosquePersonajeItem)

	# ✅ Filtrar solo los ítems que son personajes
	var personaje_items := updated_items.filter(func(i): return i is ElUltimoBosquePersonajeItem)

	for item in personaje_items:
		var ya_mostrado := items_mostrados.any(func(mostrado):
			return mostrado is ElUltimoBosquePersonajeItem and mostrado.source_game == item.source_game
		)

		if not ya_mostrado:
			_add_item_to_ui(item)
			items_mostrados.append(item)
			print("👤 Personaje agregado al HUD:", item)

	print("📢 Señal recibida con", personaje_items.size(), "personajes.")

func _add_item_to_ui(item: ElUltimoBosquePersonajeItem) -> void:
	for slot in items_container.get_children():
		if slot is ElUltimoBosqueItemSlot and not slot.is_filled():
			slot.fill(item)
			return

	if items_container.get_child_count() < 3:
		var new_slot := TextureRect.new()
		new_slot.set_script(load("res://RUTA/ElUltimoBosqueItemSlot.gd")) # 🔁 Reemplaza con la ruta real
		new_slot.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		new_slot.size_flags_vertical = Control.SIZE_EXPAND_FILL
		new_slot.set_custom_minimum_size(Vector2(64, 64))
		items_container.add_child(new_slot)
		new_slot.fill(item)
	else:
		print("⚠️ Ya hay 3 slots ocupados. No se añadirá más.")
