extends Label
var moedas = 0

func _ready():
	text = "Moedas: 0"

func adicionar_moeda():   	
	moedas += 1   
	text = "Moedas: " + str(moedas)
