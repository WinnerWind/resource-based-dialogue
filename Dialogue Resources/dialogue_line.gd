@tool
extends Resource
class_name DialogueLine

@export var custom_speaker_name:String:
	set(new_text):
		custom_speaker_name = new_text
		_set_resource_name()

@export var character:DialogueCharacter
@export_multiline var text:String:
	set(new_text):
		text = new_text
		_set_resource_name()

var speaker_name:String:
	get:
		if custom_speaker_name:
			return custom_speaker_name
		else:
			if not character == null:
				return character.character_name
			else: #No character, nor speaker name defined.
				return ""

func _set_resource_name():
	resource_name = speaker_name + " - " + text
