@tool
extends Resource
class_name DialogueLine

@export var custom_speaker_name:String:
	set(new_text):
		custom_speaker_name = new_text
		_set_resource_name()

@export_multiline var text:String:
	set(new_text):
		text = new_text
		_set_resource_name()

var speaker_name:
	get:
		return custom_speaker_name

func _set_resource_name():
	resource_name = speaker_name + " - " + text
