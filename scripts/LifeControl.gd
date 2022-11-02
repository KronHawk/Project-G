extends Node2D
class_name LifeControl

func demage(lifehere, dam) -> int:
	lifehere -= dam
	return lifehere
