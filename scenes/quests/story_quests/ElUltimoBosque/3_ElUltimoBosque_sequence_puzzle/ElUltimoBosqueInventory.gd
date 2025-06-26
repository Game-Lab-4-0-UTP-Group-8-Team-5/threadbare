extends "res://scenes/globals/game_state/inventory/inventory.gd"
class_name ElUltimoBosqueInventory

func add_item(item: InventoryItem) -> void:
	# Evita duplicados del mismo tipo
	for existing_item in get_items():
		if existing_item.same_type_as(item):
			print("🚫 Ítem ya está en inventario, no se agrega:", item)
			return

	# Si no está, lo agrega normalmente
	super.add_item(item)
	print("✅ Ítem agregado:", item)
