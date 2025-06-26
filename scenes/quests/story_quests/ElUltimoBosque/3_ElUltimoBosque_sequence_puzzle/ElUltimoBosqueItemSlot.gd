extends "res://scenes/ui_elements/story_quest_progress/components/item_slot/components/item_slot.gd"
class_name ElUltimoBosqueItemSlot

func fill(inventory_item: InventoryItem) -> void:
	if is_filled():
		return

	filled_with_item = inventory_item

	# ✅ Si el item tiene el método get_world_texture, úsalo
	if inventory_item.has_method("get_world_texture"):
		texture = inventory_item.get_world_texture()
	elif inventory_item.has_method("texture"):
		texture = inventory_item.texture()
	else:
		print("⚠️ El ítem no tiene textura compatible.")
		return

	pivot_offset = size / 2.0

	if animation_player and animation_player.has_animation("item_collected"):
		animation_player.play("item_collected")
		await animation_player.animation_finished
	else:
		print("⚠️ No se encontró la animación 'item_collected'. Continuando sin esperar.")
