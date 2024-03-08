extends Node

#NUMBERS
var honey = 0
var money = 1000
var honey_cost = 5
var harvest_time = 4 #seconds

# AUTOSELLING
var auto_selling = false
var sell_ps = 1 # how many to sell per second with autosell

# AUTOHARVEST
var auto_harvest = false
var harvest_cooldown = 4

# STEROIDS
var steroids = false

func _ready():
	pass # Replace with function body.


func _process(delta):
	if auto_selling:
		if honey >= 0:
			if honey < sell_ps:
				money += honey*honey_cost
				honey = 0
			else:
				money += sell_ps*honey_cost
				honey -= sell_ps
			
