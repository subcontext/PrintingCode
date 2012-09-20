
float sharpRadius =  100;
float waveHeight = random(900, 1000);

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


//RAIN
canvas.smooth();
canvas.strokeWeight(.1);
canvas.stroke(0,0,0);
for(int x = -50; x< (canvas.width); x+=25){
canvas.line(x, random(canvas.height/8,canvas.height/4), x+200, random(0,canvas.height/16)  );
//canvas.line(x, random(0,canvas.height/4), x+200, random(0,canvas.height/4)  );
}



//WATER / CLOUD

  canvas.smooth();
  canvas.strokeWeight(5);
  canvas.stroke(255);
  canvas.fill(0, 0, 0);
  for (int i =0; i< (canvas.width*2); i+=75) {
    //  for(int j=(canvas.height/4)*3; j<canvas.height; j+=2){

    canvas.ellipse(random(i), waveHeight, random(900, 1300), random(250, 750));
  }




//LIGHTENING / ICEBERG
  canvas.noStroke();
  canvas.fill(0);



  for (int i = 0; i< 180; i +=2) { 

    // translate(width / 2, height / 2);
    float x = cos(radians(i)) * (sharpRadius / 2);
    float y = sin(radians(i)) * (sharpRadius/ 2);



    canvas.beginShape();
    canvas.vertex(canvas.width/10, canvas.height/8);
    canvas.bezierVertex(canvas.width/2, canvas.height/2, canvas.width/4, canvas.width/4, (canvas.width/4)*(x), (canvas.height/4)*(y));
    canvas.endShape();
  }



  canvas.endShape();

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

