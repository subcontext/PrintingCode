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
  RCommand.setSegmentLength(50);

  canvas = createGraphics(canvas_width, canvas_height, P2D);

  calculateResizeRatio();

  canvas.beginDraw();

  canvas.smooth();
  canvas.background(255); 

  String myWord = "FORM";

  canvas.translate(0, 3000);

  for (int j = 0; j < myWord.length(); j++)
  {
    canvas.translate(750+(j*250), 0);
    char currentChar = myWord.charAt(j); 

    RGroup grp;
    grp = font.toGroup(currentChar + "");
    grp = grp.toPolygonGroup();
    RPoint[] pnts = grp.getPoints();


    // dots
    canvas.noFill();
    canvas.strokeWeight(1);
    canvas.stroke(0, 0, 0);
    for (int i = 0; i < pnts.length; i++ ) 
    {
      RPoint p1 = pnts[floor(random(pnts.length))];
      RPoint p2 = pnts[floor(random(pnts.length))];

      canvas.line(p1.x, p1.y, p2.x, p2.y);
    }
  }

  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("BigType_v5B.tiff");
}


void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

