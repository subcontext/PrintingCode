import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 6600;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

float colorMark= random(200, 250);
int fixPoint = 102;
int count = 0; 


 

void setup() 
{

  size(510, 660);
  
   
  
  //CANVAS CONVERSION
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  calculateResizeRatio();
  canvas.beginDraw();

  canvas.background(255);
  canvas.colorMode(HSB, 200, 100, 100);
  
  
   

  //COLOR GENERATOR
  HSBColor color1 = new HSBColor(random(00, 360), 100, 90);
  println("colo" + colorMark); 
  int leftHue = (color1.h + 36) % 360;
  int rightHue = (color1.h + 324) % 360;
  HSBColor color2 = new HSBColor(leftHue, 40, color1.b);
  HSBColor color3 = new HSBColor(rightHue, 40, color1.b);


  //LINES
  canvas.smooth();
  for (int i =0; i<10000; i+=1000)
  {
    for (int j= 0; j<255; j++) {
      canvas.noFill();
      color1.display2(1400, 1500, i, random(2000, 10000));
    }
  }
  
  canvas.smooth();
   color2.display4(random(canvas.width/4, (canvas.width/4)*3), random(canvas.height/4, (canvas.width/4)*3), 2500,2500);
   //ROUND
   canvas.smooth();
  for (int i =0; i<1000; i+=10)
  {
   // for (int j= 0; j<255; j+=10) {
    
      color3.display3(i, 200, 100, random(10000, 10000));
    } 
 
 
  canvas.smooth();
  {
   // for (int j= 0; j<255; j+=10) {
    
      color3.display4(random(canvas.width/4, (canvas.width/4)*3), random(canvas.height/4, (canvas.width/4)*3), 2500,2500);
     
    } 
 
//SAVE TO CANVAS
  canvas.save("colorPortrait40.tiff");

  canvas.endDraw();

//RESIZE
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


