extends Area2D

@onready var game_manager = %GameManager
@onready var player = $coinFx
@onready var collision = $CollisionShape2D
@onready var anim = $AnimatedSprite2D


func _on_body_entered(body):
	if body.name == "CharacterBody2D":
		anim.play("collect")
		player.play()
		game_manager.add_points()
		collision.call_deferred("queue_free")


func _on_animated_sprite_2d_animation_finished():  
	if anim.animation == "collect":
		queue_free()
