import geomerative.*;

PGraphics canvas;
int canvas_width = 8000;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup() 
{
 size(800, 510);

  smooth();

  int fontSize = 1200;

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


  // get the points on font outline.
  RGroup grpS;
  grpS = font.toGroup("B");
  grpS = grpS.toPolygonGroup();
  RPoint[] pntsS = grpS.getPoints();

  RGroup grpT;
  grpT = font.toGroup("U");
  grpT = grpT.toPolygonGroup();
  RPoint[] pntsT = grpT.getPoints();
  
   RGroup grpE;
  grpE = font.toGroup("I");
  grpE = grpE.toPolygonGroup();
  RPoint[] pntsE = grpE.getPoints();

 RGroup grpC;
  grpC = font.toGroup("L");
  grpC = grpC.toPolygonGroup();
  RPoint[] pntsC = grpC.getPoints();

  
   RGroup grpH;
  grpH = font.toGroup("D");
  grpH = grpH.toPolygonGroup();
  RPoint[] pntsH = grpH.getPoints();


  canvas.translate(200, 3000);

  // dots
  canvas.noFill();
  canvas.stroke(0,0,0);
  for (int i = 0; i < pntsS.length; i++ ) 
  {
      canvas.rect(pntsS[i].x, pntsS[i].y, pntsS[i/3].x, pntsS[i/3].y);
  }

  canvas.translate(900,0);
 canvas.noFill();
  canvas.stroke(0);
  for (int i = 0; i < pntsT.length; i++ ) 
  {
canvas.rect(pntsT[i].x, pntsT[i].y, pntsT[i/3].x, pntsT[i/3].y);
  }

 canvas.translate(950,0);
 canvas.noFill();
  canvas.stroke(0);
  for (int i = 0; i < pntsR.length; i++ ) 
  {
canvas.rect(pntsR[i].x, pntsR[i].y, pntsR[i/3].x, pntsR[i/3].y);
  }

 canvas.translate(1000,0);
 canvas.noFill();
  canvas.stroke(0);
  for (int i = 0; i < pntsE.length; i++ ) 
  {
canvas.rect(pntsE[i].x, pntsE[i].y, pntsE[i/3].x, pntsE[i/3].y);
  }
  
   canvas.translate(1100,0);
 canvas.noFill();
  canvas.stroke(0);
  for (int i = 0; i < pntsT.length; i++ ) 
  {
canvas.rect(pntsT[i].x, pntsT[i].y, pntsT[i/3].x, pntsT[i/3].y);
  }
  
     canvas.translate(1150,0);
 canvas.noFill();
  canvas.stroke(0);
  for (int i = 0; i < pntsC.length; i++ ) 
  {
canvas.rect(pntsC[i].x, pntsC[i].y, pntsC[i/3].x, pntsC[i/3].y);
  }
  
  
     canvas.translate(1300,0);
 canvas.noFill();
  canvas.stroke(0);
  for (int i = 0; i < pntsH.length; i++ ) 
  {
canvas.rect(pntsH[i].x, pntsH[i].y, pntsH[i/3].x, pntsH[i/3].y);
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
