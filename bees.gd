extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	get_node("Timer").wait_time = 5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	PlayerVariables.honey  += 1


func _on_timer_timeout():
	#play  animation
	pass
