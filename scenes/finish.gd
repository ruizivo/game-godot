extends Area2D

@export var target_level = PackedScene
@onready var game_manager = %GameManager
@onready var finish = %Finish


func _on_body_entered(body):
	if body.name == "CharacterBody2D" && finish.visible :
		get_tree().change_scene_to_packed(target_level)


	
func OnPodeGanhar():
	finish.visible = true


func _on_ready():
	game_manager.PodeGanhar.connect(OnPodeGanhar)
	
	
