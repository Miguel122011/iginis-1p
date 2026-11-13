extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
	

const SPEED = 150.0
const JUMP_VELOCITY = -250.0

var vida_maxima = 100
var vida_atual = 100

@onready var barra_vida = $CanvasLayer/ProgressBar

func receber_dano(dano):
	vida_atual -= dano
	vida_atual = max(vida_atual, 0)

	barra_vida.value = vida_atual

		


func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	
	if not is_on_floor():
		velocity += get_gravity() * delta
		
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animated_sprite_2d.play("jump")
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED) 
	if direction > 0 :
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.play("run")
		animated_sprite_2d.flip_h = true
	else:
		animated_sprite_2d.play("parado")		
	move_and_slide()
