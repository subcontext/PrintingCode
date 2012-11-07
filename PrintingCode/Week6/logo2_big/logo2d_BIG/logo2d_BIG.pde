int[] colors = {
  0, 0, 0, 0
};


PImage nypl;
PImage lion;

PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

float o = 50;
Neurons [] neuronsAll = new Neurons[50];

int w = 210;
int h = 510;
int petriW = w;
int petriH = h;

void setup() {
  size(510,510);
  background(255);

frameRate(2);
  
  PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("Arial-BoldMT-80.vlw");

lion = loadImage("lionReverse.jpg");
  nypl = loadImage("nypl.jpg");
  nypl.loadPixels();
 


 // find 4 random colors from the image
  for (int i = 0; i < colors.length; i++)
  {
    int randomPixel = int(random(nypl.pixels.length));
    float r = red(nypl.pixels[randomPixel]);
    float g = green(nypl.pixels[randomPixel]);
    float b = blue(nypl.pixels[randomPixel]);
    colors[i] = color(r, g, b, o);
  }

  canvas = createGraphics(canvas_width, canvas_height, P2D);
  canvas.smooth();
  canvas.textFont(font, 500);


  canvas.beginDraw();

 canvas.background(255);
 canvas.smooth();

 canvas.stroke(0,0,0,50);
  canvas.fill(255);
 //strokeWeight(16);
 //ellipse(width/2, height/2,petriW,petriH);
  canvas.strokeWeight(100);
  
   canvas.tint(255, 255, 255, 80);
   //canvas.image(lion, canvas.width/2.5, canvas.height/3.5);
 for (int i = 3; i < neuronsAll.length; i ++){
   neuronsAll[i] = new Neurons((canvas.width/2+(random(-500,500))), (canvas.height/2+(random(-500,500))),(canvas.width/(2)+(i*2)-i),(canvas.height/(2)+(i*2)-i));
   //canvas.fill(colors[0]);

   canvas.stroke(random(150-250), random(50-(i/10),50+(i*10)), 100+i, 50);
   

   canvas.fill(random(150-250), random(50-(i/10),50+(i*10)), 100+i, 50);
// canvas.fill(random(0,250), random(50-(i/10),50+(i*10)), 100+i, 50);
    canvas.strokeWeight(10);
     //canvas.stroke(colors[1]);
//  canvas.stroke(random(0,250), random(50-(i/10),50+(i*10)), 100+i, 50);
 neuronsAll[i].display();
// ballCollection[i].move();
 }
  canvas.fill(150,150,150,150);
  canvas.text("nypl", canvas.width/2, canvas.height/2);
 
   canvas.endDraw();

  calculateResizeRatio();



  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

}





void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}


void draw() {
}

void keyPressed() {
  if (key == ' ') {
    canvas.save("15.tiff");
  }
  if (key == 'c') {
  }
}  




