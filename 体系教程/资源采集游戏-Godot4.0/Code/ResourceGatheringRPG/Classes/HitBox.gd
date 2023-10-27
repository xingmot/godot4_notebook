extends Area2D
class_name HitBox

signal hit(hurtbox:HurtBox)

func _init() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(hurtbox:HurtBox)->void:
	print(hurtbox.timer.time_left)
	if not hurtbox.invincible:
		hit.emit(hurtbox)
		hurtbox.hurt.emit(self)
