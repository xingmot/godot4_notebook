extends StaticBody2D
class_name ResourceNode

@export var node_types: Array[ResourceNodeType]
@export var starting_resources: int = 1

var current_resources: int:
	set(value):
		# 当资源被采集完时，将节点释放
		current_resources=value
		if value <= 0:
			queue_free()


func _ready() -> void:
	current_resources = starting_resources


func harvest(amount: int):
	current_resources -= amount
