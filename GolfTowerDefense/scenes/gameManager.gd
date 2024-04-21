extends Node


@onready var health = $"../UI/Panel/health_label"
@onready var scoreCounter = $"../UI/Panel/score_label"

var hp = 100

var score = 0
var multiplier = 1.0

func health_change(change):
	hp += change
	health.text = "Health: " + str(hp)

func score_change(change):
	score += change * multiplier
	scoreCounter.text = "Score: " + str(score)
