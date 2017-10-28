/**
 * Create Image. 
 * 
 * The createImage() function provides a fresh buffer of pixels to play with.
 * This example creates an image gradient.
 */

PImage img;
String[] data;
int imageWidth;
int imageHeight;

void setup() {
  size(220, 100);  
  imageWidth = 220;
  imageHeight = 100;
  
  // Load the data we're going to visualise
  data = loadStrings("/home/adrian/sandbox/github/sublime-heartbeats/HeartToImage/example.csv");

  // Find the highest and lowest values in the data
  float lowestValue = 0;
  float highestValue = float(data[0]);
  for (int v =0; v < data.length; v++)
  {
    if (float(data[v]) > highestValue)
    {
      highestValue = float(data[v]);
    }
    if (float(data[v]) < lowestValue)
    {
      lowestValue = float(data[v]);
    }
  }
  
  img = createImage(imageWidth, imageHeight, ARGB);
  for(int i = 0; i < img.pixels.length; i+=5) {
    // Map the data onto the colour space 
    float a = map(float(data[i % data.length]), lowestValue, highestValue, 255, 0);
    img.pixels[i] = color(0, a, 204, a); 
    img.pixels[i+1] = color(0, a, 204, a); 
    img.pixels[i+2] = color(0, a, 204, a); 
    img.pixels[i+3] = color(0, a, 204, a); 
    img.pixels[i+4] = color(0, a, 204, a); 
  }
  img.save("adrian.png");
  //img.resize(displayWidth, displayHeight);
}

void draw() {
  background(0);
  image(img, 0, 0);
  //image(img, mouseX-img.width/2, mouseY-img.height/2);
}