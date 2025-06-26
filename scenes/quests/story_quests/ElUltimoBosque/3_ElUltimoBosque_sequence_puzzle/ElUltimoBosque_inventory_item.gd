@tool
extends InventoryItem
class_name ElUltimoBosquePersonajeItem
@export var source_game: int
@export var item: Resource

func get_world_texture() -> Texture2D:
	print("✅ get_world_texture llamado. source_game =", source_game)
	match source_game:
		1:
			return preload("res://.godot/imported/Adan_personaje1.png-fd806689568ade8573381b32fcfefbc5.ctex")
		2:
			return preload("res://.godot/imported/Killian_personaje2.png-c205b6eceb037da5173f4d54b9b7ea84.ctex")
		3:
			return preload("res://.godot/imported/Mia_personaje3.png-9ff9e7ffe00c2f22a66a9fa6c03484ae.ctex")
		_:
			print("⚠️ Valor no reconocido, usando fallback")
			return super.get_world_texture()
