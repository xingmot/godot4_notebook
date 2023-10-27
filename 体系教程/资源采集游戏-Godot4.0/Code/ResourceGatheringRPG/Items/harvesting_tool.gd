extends EquippableItem
class_name HarvestingTool

@export var effected_nodes: Array[ResourceNodeType]
@export var min_amount: int = 1
@export var max_amount: int = 1


func interact_with_body(body):
	if body is ResourceNode:
		for type in effected_nodes:
			if body.node_types.has(type):
				print_debug('Match found at type ', type.display_name, ' on ', body.name)
				body.harvest(randi_range(min_amount,max_amount))
