PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 6600;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


void setup()
{
  size(510, 660);
  
  
    canvas = createGraphics(canvas_width, canvas_height, P2D);
  
  calculateResizeRatio();
  
  canvas.beginDraw();
  
  canvas.smooth();
  canvas.background(255); 
  canvas.noStroke();
  canvas.fill(0);
  

  
  
//HEAD NECK
canvas.beginShape();
  canvas.smooth();
  canvas.vertex(canvas.width/2, canvas.height/6);
  canvas.bezierVertex(canvas.width/3, (canvas.height/6) *2, (canvas.width / 3.5) - (canvas.width/6), canvas.height / 5 + (canvas.height/14), (canvas.width /3) *2, (canvas.height/6) *4);
  canvas.bezierVertex(canvas.width/5, (canvas.width/3) + (canvas.width/9), canvas.height/4, canvas.width/4, (canvas.width/3) + (canvas.width/9), canvas.width/4);
  canvas.endShape();
  
//BODY
  canvas.stroke(0);
  canvas.strokeWeight(10);
  canvas.fill(255);
  canvas.beginShape();
  canvas.smooth();
  canvas.vertex((canvas.width/5)-(canvas.width/2), (canvas.height/2));
  canvas.bezierVertex((canvas.width/3) - (canvas.width/2), canvas.height/1.5, canvas.width/2, canvas.height/4, (canvas.width/2)- (canvas.width/20), canvas.height/1.73);
  canvas.endShape();



//WATER
  canvas.noStroke();
  canvas.fill(0);

  canvas.rect(0, canvas.height/2, canvas.width, canvas.height/2);
  
 //WATER RIPPLES
 for(int i = 1; i< canvas.width; i+=20){
    canvas.stroke(255,255,255, 220-(i*1.5));
 strokeWeight(10);
  canvas.noFill();
  
  canvas.ellipse((canvas.width/3)+(canvas.width/20),(canvas.height/2) +(canvas.height/90), i*40, i*3.5);
  }

//WINGS
  canvas.stroke(0);
  canvas.strokeWeight(10);
  canvas.noFill();
  canvas.beginShape();
  for (int i = 0; i< (width/2); i+=(width/50)) {
    canvas.beginShape();  
  canvas.smooth();  
    canvas.vertex((canvas.width/13), (canvas.height/4));
    canvas.bezierVertex(canvas.width/3-(i*3), canvas.height/100+(i*4), canvas.width/5-(i*10), canvas.height/3-(i*10), canvas.width/2.5, canvas.height/2);
    canvas.bezierVertex(canvas.width/5-(i*5), canvas.height/3+i, canvas.width/5+1, canvas.height/4, canvas.width/10, canvas.height/4);
    canvas.endShape();
  }

 canvas.endDraw();
  
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;
  
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  
	canvas.save("grab1.tiff");

}

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;
  
  if(ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

