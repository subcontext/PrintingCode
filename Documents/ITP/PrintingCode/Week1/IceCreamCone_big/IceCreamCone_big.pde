PGraphics canvas;
int canvas_width = 3600;
int canvas_height = 3600;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


void setup()
{ 
  size(600, 600);
  background(0);
  
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  
  calculateResizeRatio();
  
  canvas.beginDraw();
  
  
    canvas.background(0);
    canvas.strokeWeight(30);
    canvas.stroke(255);
    canvas.noFill();
    canvas.ellipseMode(CENTER);
    canvas.ellipse(2100,2100,1200,1200);
    
    canvas.fill(255);
    canvas.triangle(1500,1950,900,600,2100,1500);
    
    canvas.stroke(0);
    canvas.fill(255);
    canvas.rect(1500,2640,1230,60);
  canvas.endDraw();
  
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  
  canvas.save("grab.png");
}



void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}
