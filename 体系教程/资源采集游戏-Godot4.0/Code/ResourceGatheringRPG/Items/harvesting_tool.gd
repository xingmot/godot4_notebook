extends EquippableItem

class_name HarvestingTool

func harvest():
	pass

func interact_with_body(body):
	if body is ResourceNode:
		print("Interact with resourceNode!")
