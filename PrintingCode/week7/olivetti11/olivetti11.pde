import toxi.geom.*;
import processing.opengl.*;

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
 //size(680, 510, OPENGL);
 size(680, 510);
PFont font;
//font = loadFont("Olivetti Type2.vlw");
  smooth();
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  triangleArray = new triangleClass[numShapes]; 
  triangle2Array = new triangle2Class[numShapes]; 


  calculateResizeRatio();

  canvas.beginDraw();
  canvas.smooth();
  canvas.background(255, 255, 255);
  
  
/*
//background texture1
  for (int i = 0; i < canvas.width /5; i+=random(2,40))
  {
    for (int j = 0; j < canvas.height*3; j+=random(2,30)) {
      canvas.fill(255, 255, 240);
      canvas.stroke(218, 165, 32);
      canvas.line(i, j, i+1, j+1);
    }
  }

  for (int i = 0; i < canvas.width; i+=random(50,100))
  {
    for (int j = 0; j < canvas.height; j+=random(50,100)) {
      canvas.fill(255, 255, 240);
      canvas.stroke(218, 165, 32);
      float backgroundX = random(i);
      float backgroundY = random(j);
      canvas.line(i, j, i+1, j+1);
    }
  }
*/
  
  //background texture2
color leftColor = color(255,255,245);
   color rightColor = color(255,255,255);
   canvas.noStroke();
   canvas.beginShape(POLYGON);
   canvas.fill(leftColor);
   canvas.vertex(0, 0);
   canvas.fill(rightColor);
   canvas.vertex(canvas.width, 0);
   canvas.fill(rightColor);
   canvas.vertex(canvas.width, canvas.height);
   canvas.fill(leftColor);
   canvas.vertex(0, canvas.height);
   canvas.endShape(CLOSE);
   

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
    //COLOR WEIGHTED RANDOMIZATION
    for (int l = 0; l < numShapes; l+=2) 
    { 
      for (int m = 0; m < numShapes; m++) 
      {
        WeightedRandomSet<color> colors = new WeightedRandomSet<color>();
 
        colors.add(color(34, 139, 24), 10);
        colors.add(color(225, 225, 0), 5);
        
        color chosenColor = colors.getRandom();
        
        
        
        float r1= random(34, 255);
        float g= random(42, 255);
        float b= (random(42, 255));

        if (r1 >0 && r1 < 90) {
          r1 = 34;
          g = 139; 
          b = 24;
        } 
        else if ( r1 > 200 && r1 < 240) {
          r1 =255;
          g = 225; 
          b = 0;
        } 
        else if ( r1 > 100 && r1 < 189) {
          r1 = 178;
          g = 34;
          b = 34;
        }
        else { 
          r1 = 230;
          g = 230;
          b = 230;
        }
        canvas.fill(r1, g, b, 170);
        float lx1 =p.x+l;
        float ly1 =p.y+m;
        float lx2 = p2.x+l;  
        float ly2 = p2.y-(canvas.height/8)+m; 
        float lx3=p2.x+pointWidth+random(-50, 50);
        float ly3= p2.y-(canvas.height/8)+random(-50, 100)+m;
        Spline2D spline = new Spline2D(points);
        //ArrayList<Vec2D> morePoints = (ArrayList) spline.getDecimatedVertices(100, false);
        canvas.beginShape();

        for (int j = 0; j < points.size(); j++) 
        {
          Vec2D r = points.get(j);
          triangleArray[l] = new triangleClass(lx1, ly1, lx2, ly2, lx3, ly3); 
          println(lx1);
          triangle2Array[m] = new triangle2Class(lx2, ly2, lx3, ly3, lx1+pointWidth, y2+p2.y); 
          canvas.noStroke();
          triangleArray[l].display();
          triangle2Array[m].display();
          
          
          canvas.endShape();
          
          //green triangle
canvas.fill(34,139,24,100);
          canvas.triangle(canvas.width/2, canvas.height/8, canvas.width/2+canvas.width/20, canvas.height/5, canvas.width/3, canvas.height/8);
          canvas.fill(34,139,24,10);
          canvas.triangle(canvas.width/3, canvas.height/6+canvas.height/12, canvas.width/2, canvas.height/8, canvas.width/3, canvas.height/8);
          // canvas.stroke(0);
          canvas.stroke(0);
canvas.line(canvas.width/3, canvas.height/6+canvas.height/12,canvas.width/2+canvas.width/20, canvas.height/5);

          canvas.beginShape();
          for (int k = 0; k < points.size(); k++) 
          {


            canvas.noFill();
            canvas.strokeWeight(10);
            Vec2D q = points.get(k);
            canvas.stroke(0);
            canvas.vertex(q.x + random(5), q.y + random(5));
            
    
          }
        }
      }
    }
  }
 
  
    

  canvas.endShape();
/*
              String o = "o l i v e t t i";
canvas.fill(50);
canvas.stroke(0);
canvas.text(o, canvas.width*.80, canvas.height*.80);  
*/

  canvas.endDraw();

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("olivetti2.tiff");
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

