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

  int fontSize = 2400;

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


  canvas.translate(100, 3000);

  // dots
  canvas.noFill();
  canvas.stroke(0,0,0,200);
  for (int i = 0; i < pnts.length; i++ ) 
  {
    canvas.strokeWeight(random(.5,3));
     RPoint p1 = pnts[floor(random(pnts.length))];
      RPoint p2 = pnts[floor(random(pnts.length))];

      canvas.line(p1.x, p1.y, p2.x, p2.y);

//println("point " + i + " x = " + pnts[i].x + ":" + "point " + i + " y = " + pnts[i].y);
     
    
  }

  canvas.translate(1300,0);
 canvas.noFill();
  canvas.stroke(0,0,0,200);
  for (int i = 0; i < pntsO.length; i++ ) 
  {
    canvas.strokeWeight(random(.5,3));
     RPoint p1 = pntsO[floor(random(pntsO.length))];
      RPoint p2 = pntsO[floor(random(pntsO.length))];

    
 canvas.line(p1.x, p1.y, p2.x, p2.y);

//println("point " + i + " x = " + pntsO[i].x + ":" + "point " + i + " y = " + pntsO[i].y);
 
    
  }

 canvas.translate(1700,0);
 canvas.noFill();
  canvas.stroke(0,0,0,200);
  for (int i = 0; i < pntsR.length; i++ ) 
  {
    canvas.strokeWeight(random(.5,3));
    RPoint p1 = pntsR[floor(random(pntsR.length))];
      RPoint p2 = pntsR[floor(random(pntsR.length))];

 canvas.line(p1.x, p1.y, p2.x, p2.y);

//println("point " + i + " x = " + pntsR[i].x + ":" + "point " + i + " y = " + pntsR[i].y);
 
    
  }

 canvas.translate(1600,0);
 canvas.noFill();
  canvas.stroke(0,0,0,200);
  for (int i = 0; i < pntsM.length; i++ ) 
  {
    canvas.strokeWeight(random(.5,317));
    RPoint p1 = pntsM[floor(random(pntsM.length))];
      RPoint p2 = pntsM[floor(random(pntsM.length))];

 canvas.line(p1.x, p1.y, p2.x, p2.y);

//println("point " + i + " x = " + pntsM[i].x + ":" + "point " + i + " y = " + pntsM[i].y);
 
   
  }
  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("BigType_v5C.tiff");
}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

