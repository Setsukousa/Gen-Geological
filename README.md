# Gen Geological

This repository contains a Processing sketch that generates a series of images with layered color effects, simulating geological strata with a two-tone filter effect. The sketch uses Perlin noise to create a natural-looking base line and overlays the generated artwork with a textured frosted glass effect.

## Prerequisites

Before running this sketch, you need to have Processing 3 or later installed on your computer. Processing is an open-source graphical library and integrated development environment (IDE) built for the electronic arts, new media art, and visual design communities.

You can download Processing from the official website:

- [Processing Download Page](https://processing.org/download/)

## Running the Sketch

To run the sketch, follow these steps:

1. Open the Processing IDE on your computer.
2. Create a new sketch by clicking `File > New` in the IDE.
3. Copy the entire code from the provided `.pde` files into the new sketch window in the Processing IDE.
4. Save the sketch by clicking `File > Save` or pressing `Ctrl+S` (or `Cmd+S` on macOS).
5. Run the sketch by clicking the `Run` button (the triangular button at the top-left corner of the IDE), or by pressing `Ctrl+R` (or `Cmd+R` on macOS).
6. The program will generate and save a series of images to the `output` directory within your sketch folder.

## Output

The sketch will produce a set of images defined by the `numImages` variable. These images will be saved in the `output` directory with sequentially numbered filenames like `image-0001.png`, `image-0002.png`, etc.

## Configuration

You can modify the following parameters in the sketch to change the output:

- `numLayers`: Number of color layers to generate.
- `numImages`: Number of images you want to generate.
- Randomness parameters (`random1`, `random2`, etc.): Adjust these to change the randomness of the noise and color distribution.

Please ensure that the `output` directory exists within your sketch folder before running the sketch.

## License

This project is open-source and available under the [MIT License](LICENSE).