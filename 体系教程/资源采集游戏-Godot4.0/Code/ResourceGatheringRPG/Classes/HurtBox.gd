extends Area2D
class_name HurtBox

signal hurt(hitbox:HitBox)

@export var invincibility_time := 0.1
var timer:Timer
var invincible := false

func _init() -> void:
	area_entered.connect(_on_area_entered)
	timer = Timer.new()
	timer.one_shot = true
	timer.process_callback=Timer.TIMER_PROCESS_PHYSICS
	timer.autostart = false
	timer.timeout.connect(_on_timmer_timeout)
	self.add_child(timer)

func _on_area_entered(hitbox:HitBox)->void:
	if not invincible:
		hurt.emit(hitbox)
		hitbox.hit.emit(self)
		invincible=true
		timer.start(invincibility_time)
		
func _on_timmer_timeout()->void:
	print("timmer is timeout")
	invincible=false
