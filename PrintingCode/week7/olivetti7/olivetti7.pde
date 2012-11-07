import toxi.geom.*;

PGraphics canvas;
int canvas_width = 6800;
int canvas_height = 5100;

triangleClass[] triangleArray;
triangle2Class[] triangle2Array;
int numShapes = 1; 
float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


void setup()
{
  size(680, 510); 

  smooth();
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  triangleArray = new triangleClass[numShapes]; 
   triangle2Array = new triangle2Class[numShapes]; 


  calculateResizeRatio();

  canvas.beginDraw();
  canvas.smooth();
  canvas.background(255);

  canvas.noFill();
  canvas.noStroke();
  canvas.strokeWeight(10);

  int pointNum = 9;
  int pointWidth =canvas.width / pointNum;
  ArrayList<Vec2D> points = new ArrayList();

  for (int i = 0; i < pointNum + 1; i++)
  {
    float x = i * pointWidth;
    float x2 = i * pointWidth;
    float y = (canvas.height*.66) + random(-500, 500);
    float y2 = (canvas.height*.33) + random(-500, 500);
    Vec2D p = new Vec2D(x, y);
    Vec2D p2 = new Vec2D(x2, y2);

    points.add(p);


            canvas.stroke(0);
//           canvas.line(p2.x, p2.y, p2.x+pointWidth, p2.y);

   
canvas.noStroke();
    for (int l = 0; l < numShapes; l+=2) 
    { 
      for (int m = 0; m < numShapes; m++) 
      {
        canvas.fill(random(255), random(255), random(255), 100);
        float lx1 =p.x+l;
        float ly1 =p.y+m;
        float lx2 = p2.x+l;  
        float ly2 = p2.y-(canvas.height/6)+m; 
        float lx3=p2.x+random(200, 800)+l;
        float ly3= p2.y-(canvas.height/6)+random(-50, 100)+m;

          triangleArray[l] = new triangleClass(lx1, ly1, lx2, ly2, lx3, ly3); 
          println(lx1);
       triangle2Array[m] = new triangle2Class(lx2, ly2, lx3, ly3,triangleArray[l].x3,ly1); 
        triangleArray[l].display();
         triangle2Array[m].display();
        // canvas.stroke(0);
    
   
  
  canvas.stroke(0);
  canvas.noFill();
  Spline2D spline = new Spline2D(points);
 //ArrayList<Vec2D> morePoints = (ArrayList) spline.getDecimatedVertices(100, false);
canvas.beginShape();
  for(int j = 0; j < points.size(); j++) 
  {
    Vec2D q = points.get(j);
canvas.vertex(q.x + random(5), q.y + random(5));
  }
      }
    }

  }
  
canvas.endShape();

  /*  for (int i = 0; i < points.size(); i++)
   {
   for(int j=0; j < points.size(); j+=3)
   {
   
   Vec2D p = points.get(i);
   canvas.vertex(p.x, p.y);
   canvas.ellipse(p.x, p.y, 5, 5);
   
   Vec2D p2 = points.get(j);
   if(p2.y > canvas.height / 2) {
   
 
   //  canvas.triangle(p.x, p.y, p2.x, p2.y-(canvas.height/3), p2.x+random(100,400), (p2.y-(canvas.height/3))+random(50,100));
   }
   }
   
   }
   canvas.endShape();
   */
  /*
  Spline2D spline = new Spline2D(points);
   //ArrayList<Vec2D> morePoints = (ArrayList) spline.getDecimatedVertices(100, false);
   canvas.smooth();
   //canvas.fill((random(0,255)),(random(0,255)),(random(0,255)));
   canvas.beginShape();
   
   for(int i = 0; i < points.size(); i+=2) {
   for(int j = 0; j < points.size(); j+=4) 
   {
   canvas.fill(i, j, i);
   Vec2D p = points.get(i);
   Vec2D p2 = points.get(j);
   //canvas.vertex(p.x + random(5), p.y + random(5));
   canvas.triangle(p.x+i, p.y+j, p2.x+i, p2.y-(canvas.height/3)+j, p2.x+random(100,400)+i, (p2.y-(canvas.height/3))+random(50,100)+j);
   }
   
   
   
   canvas.endShape();
   }
   */

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



class triangleClass 
{ 
  color colour; 
  float x1; 
  float y1; 
  float x2; 
  float y2; 
  float x3; 
  float y3; 

  triangleClass(float x1, float y1, float x2, float y2, float x3, float y3) 
  { 
    this.colour = colour; 
    this.x1 = x1; 
    this.y1 = y1; 
    this.x2 = x2; 
    this.y2 = y2; 
    this.x3 = x3; 
    this.y3 = y3;
  } 

  void display() 
  { 
    canvas.smooth(); 
    //canvas.fill(colour); 
    //stroke(127); 
    //ellipseMode(CORNER); 
    canvas.triangle(x1, y1, x2, y2, x3, y3);
  }
} 

class triangle2Class 
{ 
  color colour; 
  float x1; 
  float y1; 
  float x2; 
  float y2; 
  float x3; 
  float y3; 

  triangle2Class(float x1, float y1, float x2, float y2, float x3, float y3) 
  { 
    this.colour = colour; 
    this.x1 = x1; 
    this.y1 = y1; 
    this.x2 = x2; 
    this.y2 = y2; 
    this.x3 = x3; 
    this.y3 = y3;
  } 

  void display() 
  { 
    canvas.smooth(); 
    //canvas.fill(colour); 
    //stroke(127); 
    //ellipseMode(CORNER); 
    canvas.triangle(x1, y1, x2, y2, x3, y3);
  }
} 

