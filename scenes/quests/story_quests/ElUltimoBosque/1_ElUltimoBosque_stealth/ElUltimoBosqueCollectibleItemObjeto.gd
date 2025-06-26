# Este es el nodo de la escena
extends "res://scenes/quests/story_quests/props/collectible_item/components/collectible_item.gd"
class_name ElUltimoBosqueCollectibleItemObjeto

# 👇❌ NO DECLARES esto si ya existe en el padre
# @export var item: ElUltimoBosqueObjetoInventoryItem

func _ready() -> void:
	super._ready()
	if not GameState.item_collected.is_connected(_on_item_recolectado):
		GameState.item_collected.connect(_on_item_recolectado)

func _on_item_recolectado(collected_item: InventoryItem) -> void:
	if collected_item == item and collected_item is ElUltimoBosqueObjetoInventoryItem:
		var hud := get_tree().get_first_node_in_group("HUDObjetos")
		if hud:
			hud.agregar_objeto(collected_item)
			print("✅ Objeto agregado al HUDObjetos:", collected_item)
	else:
		print("❌ No es un objeto válido o no coincide. No se agregó al HUD.")
