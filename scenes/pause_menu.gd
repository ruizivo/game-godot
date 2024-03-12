extends CanvasLayer

@onready var resume_btn = $MenuHolder/ResumeBtn
@onready var quit_btn = $MenuHolder/QuitBtn

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false 
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("jump"):
		if resume_btn.has_focus():
			_on_resume_btn_pressed()
		elif quit_btn.has_focus():
			_on_quit_btn_pressed()
	pass


func _unhandled_input(event):
	if event.is_action_pressed("quit"): 
		get_tree().paused = !visible
		visible = !visible
		resume_btn.grab_focus()
	

func _on_quit_btn_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/mainMenu.tscn")


func _on_resume_btn_pressed():
	get_tree().paused = false
	visible = false 
