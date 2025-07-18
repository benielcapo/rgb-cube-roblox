# RGB Cube Generator for Roblox

This Roblox Lua script creates a 3D cube made of smaller colored parts, where each part's color represents a point in the RGB color space. The cube visually displays a gradient across red, green, and blue values in a grid.

---

## Features

- Generates a cubic grid of parts (`Parts`).
- Each part is colored based on its position mapped to RGB values.
- The cube size and spacing between parts are configurable.
- Parts are anchored and use the `SmoothPlastic` material.
- The script pauses briefly after creating a set number of parts to avoid performance spikes.
- All parts are grouped under a Model named `"RGB Cube"` in the Workspace.

---

## Configuration Variables

| Variable           | Description                                   | Default Value   |
|--------------------|-----------------------------------------------|-----------------|
| `OFFSET`           | Vector3 offset to position the entire cube    | `(0, 10, 0)`    |
| `ITERS`            | Number of iterations per RGB axis (cube size) | `20`            |
| `COLOR3_MULTIPLIER`| Multiplier to scale iteration index to 0-255 RGB values | `255 / ITERS` |
| `WAIT`             | Delay (in seconds) to pause after batch creation | `0.01`       |
| `ITER_INDEX_WAIT`  | Number of parts created before pausing        | `500`           |
| `CUBE_SCALE`       | Scale multiplier for part size and position   | `1`             |
| `SPACING`          | Distance between each cube part                | `5`             |
| `MODEL_NAME`       | Name of the model grouping all parts           | `"RGB Cube"`    |

---

## How It Works

1. **Model Creation:** A new `Model` named `"RGB Cube"` is created inside the `workspace` to hold all the generated parts.
2. **Color Calculation:** The script loops over `i`, `ii`, and `iii` from 0 to `ITERS` to cover the red, green, and blue axes respectively.
3. **Color Mapping:** Each loop index is multiplied by `COLOR3_MULTIPLIER` to map the index to a valid RGB value from 0 to 255.
4. **Part Creation:** For each combination `(i, ii, iii)`, a new `Part` is created with:
   - Size scaled by `CUBE_SCALE`
   - Color set to the calculated RGB value
   - Material set to `SmoothPlastic`
   - Anchored to prevent physics interference
   - Positioned in 3D space based on indices, spacing, offset, and scale
5. **Performance Throttling:** After every `ITER_INDEX_WAIT` parts, the script waits for `WAIT` seconds to reduce lag or frame drops.
6. **Naming:** Each part is named by its indices, e.g. `"0, 0, 0"`.

---

## Usage

1. Copy the script into a Roblox Script object inside the ServerScriptService.
2. Adjust the configurable variables at the top as needed for cube size, spacing, or delays.
3. Run the game to see the RGB cube generated in the world.

---

## Notes

- Increasing `ITERS` exponentially increases the number of parts (`(ITERS+1)^3`). Be cautious with large values to avoid performance issues.
- You can modify `OFFSET` to reposition the entire cube in the world.
- Use `SPACING` to adjust the distance between parts to prevent overlaps.
- The `WAIT` and `ITER_INDEX_WAIT` variables help keep the game responsive during part creation.

---

## Example Visual Result

A colorful 3D cube made of small parts transitioning smoothly through all RGB color combinations, floating above the origin at position `(0, 10, 0)` by default.

---
