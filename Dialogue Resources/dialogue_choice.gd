@tool
extends Resource
class_name DialogueChoice

@export var text:String:
	set(new_text):
		text = new_text
		_set_resource_name()

@export var dialogue_to_start:DialogueAct

func _set_resource_name():
	resource_name = text
