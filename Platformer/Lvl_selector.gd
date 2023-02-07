extends Node2D

onready var lvl_1_diamond = $Lvl1_diamond
onready var lvl_2_diamond = $Lvl2_diamond
onready var lvl_3_diamond = $Lvl3_diamond

func _ready():
	lvl_1_diamond.text = str(EventBus.lvl1_diamond) + " / 7"
	lvl_2_diamond.text = str(EventBus.lvl2_diamond) + " / 7"
	lvl_3_diamond.text = str(EventBus.lvl3_diamond) + " / 7"
	
func _process(delta):
	if EventBus.lvl1_diamond > 7:
		EventBus.lvl1_diamond = 7
		lvl_1_diamond.text = str(EventBus.lvl1_diamond) + " / 7"
	if EventBus.lvl2_diamond > 7:
		EventBus.lvl2_diamond = 7
		lvl_2_diamond.text = str(EventBus.lvl2_diamond) + " / 7"
	if EventBus.lvl3_diamond > 7:
		EventBus.lvl3_diamond = 7
		lvl_3_diamond.text = str(EventBus.lvl3_diamond) + " / 7"
