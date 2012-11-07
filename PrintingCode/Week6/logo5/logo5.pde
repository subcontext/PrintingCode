int[] colors = {
  0, 0, 0, 0
};

PImage money;
PImage bacteria;
PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

float o = 50;
Bacteria [] bacteriaAll = new Bacteria[50];

int w = width;
int h = height;

int petriW = w;
int petriH = w;

void setup() {
  size(510, 510);
  //  background(255);

  //frameRate(2);

  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("Arial-BoldMT-80.vlw");
  bacteria = loadImage("bacteria1.jpg");
  bacteria.loadPixels();
  money = loadImage("Dollar.jpg");
  money.loadPixels();



  // find 4 random colors from the image
  for (int i = 0; i < colors.length; i++)
  {
    int randomPixel = int(random(bacteria.pixels.length));
    float r = red(bacteria.pixels[randomPixel]);
    float g = green(bacteria.pixels[randomPixel]);
    float b = blue(bacteria.pixels[randomPixel]);
    colors[i] = color(r, g, b, o);
  }


  canvas = createGraphics(canvas_width, canvas_height, P2D);
  canvas.smooth();
  canvas.textFont(font, 1600);


  canvas.beginDraw();


  canvas.background(255); 
  //canvas.background(255);
  canvas.smooth();



  for (int i = 3; i < bacteriaAll.length; i ++) {
    bacteriaAll[i] = new Bacteria(random(((canvas.width/4)*1.5), (canvas.width/4)*2.5), random(((canvas.height/4)*1.25), (canvas.height/4)*2.75), random(i*18), random((canvas.width/50), (canvas.width/2)));
    canvas.noStroke();
    //canvas.fill(250, 50+(i/10), 100+i, 10);
      canvas.fill(colors[0]);
    bacteriaAll[i].display();
    // ballCollection[i].move();
  }
  
    for (int i = 3; i < bacteriaAll.length; i ++) {
    bacteriaAll[i] = new Bacteria(random(((canvas.width/4)*1.5), (canvas.width/4)*2.5), random(((canvas.height/4)*1.25), (canvas.height/4)*2.75), random(i*18), random((canvas.width/50), (canvas.width/2)));
    canvas.noStroke();
    //canvas.fill(250, 50+(i/10), 100+i, 10);
      canvas.fill(colors[1]);
    bacteriaAll[i].display();
    // ballCollection[i].move();
  }
  
      for (int i = 3; i < bacteriaAll.length; i ++) {
    bacteriaAll[i] = new Bacteria(random(((canvas.width/4)*1.5), (canvas.width/4)*2.5), random(((canvas.height/4)*1.25), (canvas.height/4)*2.75), random(i*18), random((canvas.width/50), (canvas.width/2)));
    canvas.noStroke();
    //canvas.fill(250, 50+(i/10), 100+i, 10);
      canvas.fill(colors[2]);
    bacteriaAll[i].display();
    // ballCollection[i].move();
  }
  
     for (int i = 3; i < bacteriaAll.length; i ++) {
    bacteriaAll[i] = new Bacteria(random(((canvas.width/4)*1.5), (canvas.width/4)*2.5), random(((canvas.height/4)*1.25), (canvas.height/4)*2.75), random(i*18), random((canvas.width/50), (canvas.width/2)));
    canvas.noStroke();
    //canvas.fill(250, 50+(i/10), 100+i, 10);
      canvas.fill(colors[3]);
    bacteriaAll[i].display();
    // ballCollection[i].move();
  }
  
  
  canvas.stroke(0, 0, 0, 50);
  canvas.smooth();
  canvas.strokeWeight(canvas.width/20);

  canvas.ellipse(canvas.width/2, canvas.height/2, (canvas.width/5)*3, (canvas.width/5)*3);
  println(canvas.width/2);
  canvas.strokeWeight(canvas.width/1000);
  canvas.fill(0, 0, 0, 50);
  canvas.text("ie", canvas.width/2, random((canvas.height/2), (canvas.width/4)*2.5));

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
    canvas.save("5 .tiff");
  }
  if (key == 'c') {
  }
}  

