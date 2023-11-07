extends Reference
class_name PVA

var name: String = "PVA"
var length: int
var _data: PoolVector2Array

func _init() -> void:
	_data = PoolVector2Array()
	length = _data.size()

func enqueue(v) -> void:
	_data.append(v)
	length = _data.size()

func deque():
	if _data.size() == 0:
		return null
	var v = _data[0]
	_data.remove(0)
	length = _data.size()
	return v

func dump() -> void:
	pass

