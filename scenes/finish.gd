extends Area2D

@export var target_level = PackedScene
@onready var game_manager = %GameManager
@onready var finish = %Finish
@onready var collision_shape_2d = $CollisionShape2D
@onready var anim = $AnimatedSprite2D


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		get_tree().change_scene_to_packed(target_level)
	
func OnPodeGanhar():
	finish.visible = true
	anim.play("show")
	collision_shape_2d.set_deferred("disabled", false)

func _on_ready():
	collision_shape_2d.set_deferred("disabled", true)
	game_manager.PodeGanhar.connect(OnPodeGanhar)
	
	
