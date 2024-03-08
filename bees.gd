extends AnimatedSprite2D
var just_spawned = false
var can_place = false
var can_harvest = false

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Timer").wait_time = PlayerVariables.harvest_time

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if just_spawned:
		position.x = get_global_mouse_position().x
		position.y = get_global_mouse_position().y - 35
		if Input.is_action_just_pressed("ia_lmb"):
			if can_place:
				just_spawned = false
	
	if PlayerVariables.auto_harvest:
		if PlayerVariables.steroids:
			play("mutated")
		else:
			play("autoharvest")
		can_harvest = false
		get_node("Button").visible = false
		get_node("Timer").stop()
		
func _on_button_pressed():
	if just_spawned == false:
		if can_harvest:
			PlayerVariables.honey  += 1
			play("bees")
			can_harvest = false
			get_node("Timer").wait_time = PlayerVariables.harvest_time
			get_node("Timer").start()

func _on_timer_timeout():
	play("honeybees")
	can_harvest = true

func _on_placing_area_entered(area):
	if area.name == "railing":
		can_place = true

func _on_placing_area_exited(area):
	if area.name == "railing":
		can_place = false

func _on_autoharvest_timeout():
	if PlayerVariables.auto_harvest:
		PlayerVariables.honey  += 1
		get_node("autoharvest").wait_time = PlayerVariables.harvest_cooldown
		get_node("autoharvest").start()
