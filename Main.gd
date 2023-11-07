#!/usr/bin/env -S godot -s
extends SceneTree

func _init() -> void:
	print("Starting!")

	var q_llq: LLQ = LLQ.new()
	test(q_llq)
	var q_pva: PVA = PVA.new()
	test(q_pva)
	var q_arr: Arr = Arr.new()
	test(q_arr)

	var sizes: Array = [1000, 10000, 100000, 1000000]
	bench_margin(sizes)
	bench_search(sizes)

	# Exactly 27550 on my computer, it might be different on yours
	#trigger_bug(27550)

	print("Done")
	quit()

func trigger_bug(n: int) -> void:
	var q: LLQ = LLQ.new()
	for v in n:
		q.enqueue(Vector2(v, v))
	# Uncomment line below to stop the bug from happening
	#q.dump()
	print("1, 2, 3 bug!")

func time_it(fn: FuncRef, q, arg: int) -> int:
	var start: int = OS.get_ticks_msec()
	fn.call_func(q, arg)
	return (OS.get_ticks_msec() - start)

func enqueue(q, number: int) -> void:
	for n in number:
		q.enqueue(Vector2(n, n))

func deque(q, number: int) -> void:
	for n in number:
		q.deque()

func bench_margin(sizes: Array) -> void:
	print("\nBench Margin")
	print("\n\tEnqueue")
	var fn: FuncRef = funcref(self, "enqueue")
	for s in sizes:
		for q in [LLQ.new(), PVA.new(), Arr.new()]:
			enqueue(q, s)
			assert(q.length == s)
			print("\t%s %7s %7s" % [q.name, s, time_it(fn, q, 1000)])
			assert(q.length == s + 1000)
			q.dump()

	print("\n\tDeque")
	fn = funcref(self, "deque")
	for s in sizes:
		for q in [LLQ.new(), PVA.new(), Arr.new()]:
			enqueue(q, s)
			assert(q.length == s)
			print("\t%s %7s %7s" % [q.name, s, time_it(fn, q, 1000)])
			assert(q.length == s - 1000)
			q.dump()

func simulate_search(q, number: int) -> void:
	q.enqueue(Vector2(0, 0))
	for v in number:
		var _d = q.deque()
		for i in 4:
			q.enqueue(Vector2(v,v))

func bench_search(sizes: Array) -> void:
	print("\nBench Search\n")
	var fn: FuncRef = funcref(self, "simulate_search")
	for n in sizes:
		for q in [LLQ.new(), PVA.new(), Arr.new()]:
			print("\t%s %7s %7s" % [q.name, n, time_it(fn, q, n)])
			q.dump()

func test(q) -> void:
	assert(q.deque() == null)
	q.enqueue(Vector2(5, 5))
	q.enqueue(Vector2(7, 7))
	q.enqueue(Vector2(9, 9))
	q.enqueue(Vector2(11, 11))
	q.enqueue(Vector2(12, 12))

	assert(q.deque() == Vector2(5,5))
	assert(q.length == 4)

	q.enqueue(Vector2(10, 10))

	assert(q.deque() == Vector2(7, 7))
	assert(q.deque() == Vector2(9, 9))
	assert(q.deque() == Vector2(11, 11))
	assert(q.deque() == Vector2(12, 12))
	assert(q.deque() == Vector2(10, 10))
	assert(q.deque() == null)
	assert(q.length == 0)

	q.enqueue(Vector2(69, 69))
	assert(q.length == 1)
	q.enqueue(Vector2(420, 420))
	assert(q.length == 2)
