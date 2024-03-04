extends Node

var honey = 0
var money = 50
var honey_cost = 5
var harvest_time = 4 #seconds
var auto_selling = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if auto_selling:
		if honey > 0:
			money += honey*honey_cost
			honey = 0
			
