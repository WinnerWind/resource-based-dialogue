@tool
extends Resource
class_name DialogueCharacter

@export var character_name:String:
	set(new_name):
		character_name = new_name
		_set_resource_name()

func _set_resource_name():
	resource_name = character_name
