import toxi.geom.*;

PGraphics canvas;
int canvas_width = 6800;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


void setup()
{
  size(680, 510); 
  
  smooth();
   canvas = createGraphics(canvas_width, canvas_height, P2D);
  calculateResizeRatio();

  canvas.beginDraw();
  canvas.smooth();
  canvas.background(255);
  
  canvas.noFill();
  canvas.stroke(0);
  canvas.strokeWeight(10);

    int pointNum = 25;
  int pointWidth =canvas.width / pointNum;
  ArrayList<Vec2D> points = new ArrayList();
  
    for (int i = 0; i < pointNum + 1; i++)
  {
    float x = i * pointWidth;
    float y = (canvas.height/2) + random(-2000, 2000);
    Vec2D p = new Vec2D(x, y);
    points.add(p);
  }
  
   for (int i = 0; i < points.size(); i++)
  {
    for(int j=0; j < points.size(); j+=3)
    {
  
    Vec2D p = points.get(i);
    canvas.vertex(p.x, p.y);
    canvas.ellipse(p.x, p.y, 5, 5);
  
    Vec2D p2 = points.get(j);
    if(p2.y > canvas.height / 2) {
      
    canvas.line(p2.x, p2.y, p2.x+pointWidth, p2.y);
    }
    }
  }
canvas.endShape();

  Spline2D spline = new Spline2D(points);
 //ArrayList<Vec2D> morePoints = (ArrayList) spline.getDecimatedVertices(100, false);
canvas.beginShape();
  for(int i = 0; i < points.size(); i++) 
  {
    Vec2D p = points.get(i);
canvas.vertex(p.x + random(5), p.y + random(5));
  }
  
  
canvas.endShape();
  
  
    canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("olivetti1.tiff");
}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

