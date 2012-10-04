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

  int fontSize = 2000;

  // initialize the geomerative library
  RG.init(this);

  // create a new font
  RFont font = new RFont("FreeSans.ttf", fontSize, RFont.LEFT);

  // tell library we want 11px between each point on the font path
  RCommand.setSegmentLength(10);

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


  canvas.translate(200, 3000);

  // dots
  canvas.noFill();
  canvas.stroke(0,0,0,5);
  for (int i = 0; i < pnts.length; i++ ) 
  {
    for (int j = 0;  j < pnts.length;  j++) {

      canvas.line(pnts[i].x, pnts[i].y, pnts[i/3].x, pnts[i/3].y);

println("point " + i + " x = " + pnts[i].x + ":" + "point " + i + " y = " + pnts[i].y);
     
    }
  }

  canvas.translate(1300,0);
 canvas.noFill();
  canvas.stroke(0,0,0,5);
  for (int i = 0; i < pntsO.length; i++ ) 
  {
    for (int j = 0;  j < pntsO.length;  j+=10) {
 canvas.line(pntsO[i].x, pntsO[i].y, pntsO[i/3].x, pntsO[i/3].y);

println("point " + i + " x = " + pntsO[i].x + ":" + "point " + i + " y = " + pntsO[i].y);
 
    }
  }

 canvas.translate(1700,0);
 canvas.noFill();
  canvas.stroke(0,0,0,5);
  for (int i = 0; i < pntsR.length; i++ ) 
  {
    for (int j = 0;  j < pntsR.length;  j+=10) {
 canvas.line(pntsR[i].x, pntsR[i].y, pntsR[i/3].x, pntsR[i/3].y);

println("point " + i + " x = " + pntsR[i].x + ":" + "point " + i + " y = " + pntsR[i].y);
 
    }
  }

 canvas.translate(1600,0);
 canvas.noFill();
  canvas.stroke(0,0,0,3);
  for (int i = 0; i < pntsM.length; i++ ) 
  {
    for (int j = 0;  j < pntsM.length;  j+=10) {
 canvas.line(pntsM[i].x, pntsM[i].y, pntsM[i/3].x, pntsM[i/3].y);

println("point " + i + " x = " + pntsM[i].x + ":" + "point " + i + " y = " + pntsM[i].y);
 
    }
  }
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("grab28.tiff");
}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

