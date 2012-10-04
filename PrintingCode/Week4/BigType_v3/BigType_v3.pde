import geomerative.*;


PGraphics canvas;
int canvas_width = 7000;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{
  size(660, 510);
 int fontSize = 1950;
  RG.init(this);

  // create a new font
  RFont font = new RFont("OpenSans-Regular.ttf", fontSize, RFont.LEFT);

  // tell library we want 11px between each point on the font path
    RCommand.setSegmentLength((fontSize/250));

  canvas = createGraphics(canvas_width, canvas_height, P2D);


  calculateResizeRatio();

  canvas.beginDraw();

  canvas.smooth();
  canvas.background(255); 

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


  canvas.translate(350, 2300);

//canvas.noStroke();
  for (int i = 0; i < pnts.length; i++ ) 
  {
    canvas.stroke(0,0,0,50);
    canvas.strokeWeight(3);
    canvas.noFill();
   // noStroke();
   // fill(0,0,0,50+i-i);
   canvas.triangle(pnts[i].x, pnts[i].y,pnts[i].x-(fontSize/10), pnts[i].y+(fontSize),pnts[i].x+(fontSize/10), pnts[i].y+((fontSize/4)*3));

//endShape();
}

  canvas.translate(1250, 0);
  for (int i = 0; i < pntsO.length; i++ ) 
  {
    canvas.stroke(0,0,0,50);
    canvas.strokeWeight(3);
    canvas.noFill();
   // noStroke();

   canvas.triangle(pntsO[i].x, pntsO[i].y,pntsO[i].x-(fontSize/10), pntsO[i].y+(fontSize),pntsO[i].x+(fontSize/10), pntsO[i].y+((fontSize/4)*3));

//endShape();
}



  canvas.translate(1800, 0);
  for (int i = 0; i < pntsR.length; i++ ) 
  {
    canvas.stroke(0,0,0,50);
    canvas.strokeWeight(3);
    canvas.noFill();
   // noStroke();
   // fill(0,0,0,50+i-i);
   canvas.triangle(pntsR[i].x, pntsR[i].y,pntsR[i].x-(fontSize/10), pntsR[i].y+(fontSize),pntsR[i].x+(fontSize/10), pntsR[i].y+((fontSize/4)*3));

//endShape();
}

  canvas.translate(1550, 0);
  for (int i = 0; i < pntsM.length; i++ ) 
  {
    canvas.stroke(0,0,0,50);
    canvas.strokeWeight(3);
    canvas.noFill();
   // noStroke();
   // fill(0,0,0,50+i-i);
   canvas.triangle(pntsM[i].x, pntsM[i].y,pntsM[i].x-(fontSize/10), pntsM[i].y+(fontSize),pntsM[i].x+(fontSize/10), pntsM[i].y+((fontSize/4)*3));

//endShape();
}


  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("BigType_v3_white.tiff");
}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

