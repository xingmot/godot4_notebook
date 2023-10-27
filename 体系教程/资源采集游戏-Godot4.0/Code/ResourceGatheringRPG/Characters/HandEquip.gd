@tool
extends Node2D

@onready var equip_sprite: Sprite2D = $EquipSprite

@export var equiped_item : EquippableItem:
	set(next_equipped):
		equiped_item = next_equipped
		if !is_node_ready():
			await ready
		equip_sprite.texture=equiped_item.texture



func _on_hit_box_hit(hurtbox:HurtBox) -> void:
	if equiped_item.has_method('interact_with_body'):
		equiped_item.interact_with_body(hurtbox.get_parent())
