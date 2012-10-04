import geomerative.*;


PGraphics canvas;
int canvas_width = 10000;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{
  size(1000, 510);
 int fontSize = 1000;
  RG.init(this);

  // create a new font
  RFont font = new RFont("FreeSans.ttf", fontSize, RFont.LEFT);

  // tell library we want 11px between each point on the font path
  RCommand.setSegmentLength(40);

  canvas = createGraphics(canvas_width, canvas_height, P2D);


  calculateResizeRatio();

  canvas.beginDraw();

  canvas.smooth();
  canvas.background(255); 




/*RGroup grp;
  grp = font.toGroup("S H I F T");
  grp = grp.toPolygonGroup();
  RPoint[] pnts = grp.getPoints();
*/


RGroup grpP;
  grpP = font.toGroup("S U B C O N T E X T");
  grpP = grpP.toPolygonGroup();
  RPoint[] pntsP = grpP.getPoints();

  canvas.translate(1000, 1000);

 /* // dots
  canvas.fill(0);
  canvas.stroke(0);
  for (int i = 0; i < pnts.length; i++ ) 
  {
    canvas.rect(pnts[i].x, pnts[i].y, 50, 100);
  }

*/
 //canvas.translate(1100, 1100);

  // dots
  canvas.fill(0);
  canvas.stroke(0, 0, 0);
  for (int i = 0; i < pntsP.length; i++ ) 
  {
    canvas.line(pntsP[i].x, pntsP[i].y, pntsP[i].y, pntsP[i].x);
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

