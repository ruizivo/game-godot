extends Node

@onready var level_1 = $level1


func _ready():
	level_1.grab_focus()
	


func _on_level_1_pressed():
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_level_2_pressed():
	get_tree().change_scene_to_file("res://scenes/level2.tscn")
