@tool
extends InventoryItem
class_name ElUltimoBosqueObjetoInventoryItem

@export var tipo_objeto: int
@export var item: Resource

func get_world_texture() -> Texture2D:
	match tipo_objeto:
		1:
			return preload("res://.godot/imported/zapatos.png-d25fc332ec84ca8515630a8a545ab4de.ctex")
		2:
			return preload("res://.godot/imported/cinturon.png-574b23f111a52a8eadc005d1496105c1.ctex")
		3:
			return preload("res://.godot/imported/guante.png-9db043cc0a1bb45b4d1b43c51dd47ded.ctex")
		_:
			print("⚠️ Valor no reconocido, usando fallback")
			return super.get_world_texture()
