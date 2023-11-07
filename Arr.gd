extends Reference
class_name Arr

var name: String = "ARR"
var length: int
var _data: Array

func _init() -> void:
	_data = []
	length = _data.size()

func enqueue(v) -> void:
	_data.append(v)
	length = _data.size()

func deque():
	var v = _data.pop_front()
	length = _data.size()
	return v

func dump() -> void:
	pass

