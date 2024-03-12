extends Node

@onready var points_label = %PointsLabel

var points = 0

signal PodeGanhar()


func add_points():
	points += 1
	points_label.text = "Points: " +  str(points)
	print(points)
	if points == 12:
		PodeGanhar.emit()
 
