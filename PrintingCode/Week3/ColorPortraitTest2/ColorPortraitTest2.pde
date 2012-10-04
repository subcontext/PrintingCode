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

  canvas.background(255, 255, 245);
  canvas.colorMode(HSB, 200, 100, 100);
  
  
   

  //COLOR GENERATOR
  HSBColor color1 = new HSBColor(random(100, 280), 60, 100);
  println("colorMark" + colorMark); 
  int leftHue = (color1.h + 40) % 360;
  int rightHue = (color1.h + 80) % 360;
  HSBColor color2 = new HSBColor(leftHue, 60, color1.b);
  HSBColor color3 = new HSBColor(rightHue, 60, color1.b);

  //LINES
  for (int i =0; i<10000; i+=1000)
  {
    for (int j= 0; j<255; j++) {
      canvas.noFill();
      color1.display2(1400, 1700, i, random(2000, 10000));
    }
  }
  
   //ROUND
  for (int i =0; i<10000; i+=1000)
  {
    for (int j= 0; j<255; j++) {
      canvas.noFill();
      color2.display3(1400, 1700, i, random(2000, 10000));
    }
  }


  //SHAPE1
  /*
  canvas.smooth();
   color1.display(0, canvas.height, fixPoint, fixPoint, canvas.width/2, 0);
   canvas.smooth();
   */

  //SHAPE2
  /*canvas.smooth();
   color2.display(fixPoint , 0, fixPoint , fixPoint ,canvas.width*2, canvas.height*2);
   */
   
   //SHAPE3
   canvas.smooth();
   color3.display(random(canvas.width/2,(canvas.width/4)*3), random(canvas.height/4,canvas.width/2), fixPoint , fixPoint ,canvas.width*2, canvas.height*2);
  
   
  /*
 
   for (int z =0; z < 100; z+=10) {
   color2.display3(z*lineDensity+(220), canvas.height/2+100, z*lineDensity+(50),  canvas.height/2+100);
   }
   */
   
//SAVE TO CANVAS
  canvas.save("colorPortrait.tiff");

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


