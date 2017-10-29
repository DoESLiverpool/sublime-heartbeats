/**
 * HeartToImage
 *
 * Takes a CSV of heartrate data (raw output from an analog pulse sensor)
 * in the form of a text file with one sample per line and turns it into a
 * pattern which gets saved as a file
 *
 * Usage:
 * Set the width and height at the start of setup()
 * Change dataFile to have the name of your source data
 * When you run the sketch you'll see the output of the pattern, and a copy
 * will be saved in the same place as the data file, with a ".png" suffix
 */

PImage img;
String[] data;
int imageWidth;
int imageHeight;

String dataFile = "example.csv";


void setup() {
  size(220, 100);  
  imageWidth = 220;
  imageHeight = 100;
  
  // Load the data we're going to visualise
  data = loadStrings(dataFile);

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
  img.save(dataFile+".png");
  //img.resize(displayWidth, displayHeight);
}

void draw() {
  background(0);
  image(img, 0, 0);
  //image(img, mouseX-img.width/2, mouseY-img.height/2);
}