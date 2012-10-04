import geomerative.*;

PGraphics canvas;
int canvas_width = 6800;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup() 
{
 size(660, 510);

  smooth();

  int fontSize = 1600;

  // initialize the geomerative library
  RG.init(this);

  // create a new font
  RFont font = new RFont("FreeSans.ttf", fontSize, RFont.LEFT);

  // tell library we want 11px between each point on the font path
  RCommand.setSegmentLength(10);

 colorMode(HSB, 360, 100, 100);

  HSBColor color1 = new HSBColor(0, 100, 100);
  
  // then find colors on each side of this color by adding/subtracting
  // a specific number of degrees on the hue scale.
  int leftHue = (color1.h + 310) % 360;
  int rightHue = (color1.h + 50) % 360;
  
  HSBColor color2 = new HSBColor(leftHue, color1.s - 70, color1.b);
  HSBColor color3 = new HSBColor(rightHue, color1.s - 70, color1.b);
  
  /*
  int rectSize = 400;
  translate(40, 200);
  */
  
  canvas = createGraphics(canvas_width, canvas_height, P2D);


  calculateResizeRatio();

  canvas.beginDraw();

  canvas.smooth();
  canvas.background(255); 


  // get the points on font outline.
  RGroup grp;
  grp = font.toGroup("F");
  grp = grp.toPolygonGroup();
  RPoint[] pnts = grp.getPoints();

  RGroup grpO;
  grpO = font.toGroup("O");
  grpO = grpO.toPolygonGroup();
  RPoint[] pntsO = grpO.getPoints();

  RGroup grpR;
  grpR = font.toGroup("R");
  grpR = grpR.toPolygonGroup();
  RPoint[] pntsR = grpR.getPoints();

 RGroup grpM;
  grpM = font.toGroup("M");
  grpM = grpM.toPolygonGroup();
  RPoint[] pntsM = grpM.getPoints();


  canvas.translate(200, 3500);

  // dots
  canvas.noFill();
  canvas.stroke(0,0,0,5);
 // canvas.strokeWeight(8);
  for (int i = 0; i < pnts.length; i++ ) 
  {
    for (int j = 0;  j < pnts.length;  j+=10) {

      canvas.rect(pnts[i].x, pnts[i].y, pnts[j].x/2, pnts[j].y/2);


     
    }
  }

  canvas.translate(1300,0);
 canvas.noFill();
  canvas.stroke(0,0,0,5);
 // canvas.strokeWeight();
  for (int i = 0; i < pntsO.length; i++ ) 
  {
    for (int j = 0;  j < pntsO.length;  j+=10) {
canvas.rect(pntsO[i].x, pntsO[i].y, pntsO[j].x/2, pntsO[j].y/2);
 
    }
  }

 canvas.translate(1700,0);
 canvas.noFill();
  canvas.stroke(0,0,0,5);
//  canvas.strokeWeight();
  for (int i = 0; i < pntsR.length; i++ ) 
  {
    for (int j = 0;  j < pntsR.length;  j+=10) {
canvas.rect(pntsR[i].x, pntsR[i].y, pntsR[j].x/2, pntsR[j].y/2);
 
    }
  }

 canvas.translate(1600,0);
 canvas.noFill();
  canvas.stroke(0,0,0,3);
//  canvas.strokeWeight();
  for (int i = 0; i < pntsM.length; i++ ) 
  {
    for (int j = 0;  j < pntsM.length;  j+=10) {
canvas.rect(pntsM[i].x, pntsM[i].y, pntsM[j].x/2, pntsM[j].y/2);
 
    }
  }
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("BigType_v4_black.tiff");
}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

