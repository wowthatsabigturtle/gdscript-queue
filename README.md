# GDScript Linked List Queue & Benchmarks

## What

This is a linked list Queue implementation in GDScript. It also includes benchmarks of its performance versus a GDScript `Array` and `PoolVector2Array`. You can read more about this [here]().

## Running

1. Clone this repo
2. Make sure Godot 3.5.x is [in your $PATH](https://docs.godotengine.org/en/3.5/tutorials/editor/command_line_tutorial.html#path)
    ```
    $godot --version
    3.5.2.stable.official.170ba337a
    $
    ```
2. Run it
    ```
    $godot -s Main.gd -v
    ```

Note that the benchmark for `simulated_search` might take a while for the 1,000,000 size.
