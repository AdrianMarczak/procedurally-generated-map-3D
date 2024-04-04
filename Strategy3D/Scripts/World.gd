extends Node3D

@onready var hexagon = preload("res://scenes/hex.tscn") 
var mapSize = Vector2(10,20)
var xOffset = 1.6
var yOffset = 1.6
var hexes = []

func _ready():
	generatemap()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func generateHexagon(position):
	hexes.append(hexagon.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE))
	add_child(hexes[len(hexes)-1])
	hexes[len(hexes)-1].position = position

func generatemap():
	for x in range(int(mapSize.x * 4)):
		for y in range(int(mapSize.y * 2)):
			var position = Vector3((x-mapSize.x * 2) * xOffset, 0, (y - mapSize.y ) * yOffset)
			if x % 2 == 1:
				position.z += yOffset / 2  # Offset every odd row
			var randommap = randi_range(0,100)
			if randommap > 40:
				generateHexagon(position)
			
