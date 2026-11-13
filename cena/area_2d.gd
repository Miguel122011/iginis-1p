extends Area2D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node2D) -> void:
	get_tree().call_group("hud", "adicionar_moeda")
	queue_free()
