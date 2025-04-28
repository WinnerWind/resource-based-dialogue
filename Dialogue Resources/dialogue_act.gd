@tool
extends Resource
class_name DialogueAct

@export var dialogue_lines:Array[DialogueLine]
@export var choices:Array[DialogueChoice]
@export var is_at_end:bool

func _validate_property(property: Dictionary) -> void:
	if property.name == "choices" and is_at_end:
		property.usage = PROPERTY_USAGE_NO_EDITOR
