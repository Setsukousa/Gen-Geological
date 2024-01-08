int numLayers; // Number of layers
float baseY; // Y coordinate of the base line
float[] baseLine; // Height values of the base line
float random1;
float random2;
float random3;
float random4;
float random5;
float random6;
float random7;
float scale = 1.5;
int numImages = 10; // Number of images you want to generate
int imageCounter = 0; // Counter for tracking how many images have been generated

void setup() {
  size(2000, 2000);
  colorMode(HSB, 360, 100, 100);
  // Further initialization code...
}

void draw() {
  
  if (imageCounter < numImages) {
    
    random1 = random(0, 3);
    random2 = random(1, 3);
    random3 = random(0, 0.2);
    random4 = random(0, 360);
    random5 = random(0, 360);
    random6 = random(-1, 1);
    random7 = random(0.1, 0.5);
  
    // Number of layers between 3 and 50
    numLayers = (int)random(3, 51);
    
    // Random number for the sky's position
    float skyHeight = random(height * 0.2, height * 0.5);
    
    // Starting point of the base line is off the screen at the bottom
    baseY = height - skyHeight;
    
    // Initialize the base line
    baseLine = new float[width];
    for (int i = 0; i < width; i++) {
      baseLine[i] = skyHeight + baseY + noise(i * 0.002 * random3) * 100.0 / scale; // Generate base line using Perlin noise
    }
    
    background(random(0, 100), random(0, 100), random(0, 100)); // Color of the sky, light blue
  
    // Draw the layers
    for (int i = 0; i < numLayers; i++) {
      float hue = map(random(1,2)*i, 0, numLayers - 1, 60, 180); // Color transitions from green to blue
      float saturation = 100;
      float brightness = map(random(1,2)*i, 0, numLayers - 1, 100, 50); // Brightness transitions from bright to darker
      fill(hue, saturation, brightness);
      
      noStroke();
      
      beginShape();
      float layerHeight = map(i, 0, numLayers, baseY, 0); // Calculate the height of each layer
      
      // Draw the top line of the layer
      for (int x = 0; x < width; x++) {
        float y = baseLine[x] - layerHeight - noise(x * 0.001 * random6, i * 10 * scale * sin(0.0001 * (x+i) * random6)) * 150.0 * scale * random2;
        vertex(x, y);
      }
      
      // Draw the bottom line of the layer
      vertex(width, height);
      vertex(0, height);
      endShape(CLOSE);
    }
    applyTwoColorFilter(random4, random5, random7);
    
    saveFrame("output/image-####.png");
    
    // Update the counter
    imageCounter++;
  } else {
    // Stop after reaching the specified number of images
    noLoop();
  }

}

void applyTwoColorFilter(float hue1, float hue2, float transitionWidth) {
  loadPixels(); // Load the pixel array

  for (int i = 0; i < pixels.length; i++) {
    // Get the current pixel color
    color currentColor = pixels[i];
    // Convert to HSB
    float h = hue(currentColor);
    float s = saturation(currentColor);
    float b = brightness(currentColor);

    // Calculate the hue distance and normalize it to a range of 0-1
    float diffHue1 = abs(h - hue1);
    float diffHue2 = abs(h - hue2);
    diffHue1 = diffHue1 > 180 ? 360 - diffHue1 : diffHue1; // Circular distance on the color wheel
    diffHue2 = diffHue2 > 180 ? 360 - diffHue2 : diffHue2; // Circular distance on the color wheel
    float diff = diffHue1 / (diffHue1 + diffHue2); // Proportional difference

    // Adjust the ratio according to the transition width
    diff= constrain(diff, 0.5 - transitionWidth, 0.5 + transitionWidth);
    diff = map(diff, 0.5 - transitionWidth, 0.5 + transitionWidth, 0, 1);

    // Blend the hues
    float newHue = lerp(hue1, hue2, diff);
    pixels[i] = color(newHue, s, b);
  }

  updatePixels(); // Update the pixel array
}
