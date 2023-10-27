extends CharacterBody2D

@export var speed: float = 100.0
@onready var player_body: Sprite2D = $PlayerBody
@onready var hand_equip: Node2D = $HandEquip

@onready var animation_tree: AnimationTree = $AnimationTree
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var direction := Vector2.ZERO

func _ready() -> void:
	animation_tree.active = true

func _process(_delta: float) -> void:
	update_animation_parameters()

func _physics_process(_delta: float) -> void:
	direction = Input.get_vector("left", "right", "up", "down").normalized()
	if direction:
		velocity = direction * speed
	else:
		velocity = Vector2.ZERO
	move_and_slide()

####################################################################################################
# 更新动画状态机
####################################################################################################
func update_animation_parameters() -> void:
	animation_tree['parameters/conditions/swing'] = Input.is_action_just_pressed("use")
	
	# and not是为了防止动画循环，确保一次只满足一个状态
	animation_tree['parameters/conditions/is_idle'] = velocity == Vector2.ZERO and not animation_tree['parameters/conditions/swing']
	animation_tree['parameters/conditions/is_moving'] = velocity != Vector2.ZERO  and not animation_tree['parameters/conditions/swing']
	

	if direction.x != 0:
		animation_tree['parameters/Idle/blend_position'] = sign(direction.x)
		animation_tree['parameters/Move/blend_position'] = sign(direction.x)
		
	# 攻击动画维持：当控制方向为0时则使用Idle动画的方向
	if await animation_tree.animation_started in ['swing_left','swing_right']:
		if direction.x != 0:
			animation_tree['parameters/Swing/blend_position'] = sign(direction.x)
		else:
			animation_tree['parameters/Swing/blend_position'] = animation_tree['parameters/Idle/blend_position']
			







