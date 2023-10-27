extends Node2D

@onready var equip_sprite: Sprite2D = $EquipSprite

@export var equiped_item : EquippableItem:
	set(next_equipped):
		equiped_item = next_equipped
		if !is_node_ready():
			await ready
		equip_sprite.texture=equiped_item.texture



func _on_hit_box_hit(hurtbox) -> void:
	if(hurtbox.get_parent() is ResourceNode):
		print("hit the resource node")
