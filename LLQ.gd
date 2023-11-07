extends Reference
class_name LLQ

class Element:
	extends Reference

	var value
	var next: Reference

	func _init(v) -> void:
		value = v
		next = null

var name: String = "LLQ"
var length: int
var _head: Element
var _tail: Element

func _init() -> void:
	_head = null
	_tail = null
	length = 0

func enqueue(v) -> void:
	var elem: Element = Element.new(v)
	length += 1
	# Check if the Queue is empty
	if _tail == null:
		_tail = elem
		_head = elem
		return

	# Set the current tail's next to the new element
	_tail.next = elem
	# Set the tail pointer to the new element
	_tail = elem

func deque():
	# If empty, just return null
	if _head == null:
		return null

	length -= 1
	# Save the current head pointer
	var head: Element = _head
	# Set the head pointer to its next
	_head = _head.next
	# Check if this is the last element in the Queue, and set the tail
	# to null if so.
	if _head == null:
		_tail = null

	return head.value

func dump() -> void:
	while _head != null:
		_head = _head.next
