class Neurons{
  float xPos;
  float yPos;
  float h;
   float w;

  Neurons(float _xPos, float _yPos, float _w, float _h){

    xPos = _xPos;
    yPos = _yPos;
    w = _w;
    h = _h;
    
    
  }
  
  void display(){
    
   float circlePointX = random(xPos-(250),xPos+(250));
   float circlePointY = random(yPos-(250),yPos+(250));
 float previousX = circlePointX;
 float previousY = circlePointY;

   canvas.rectMode(CENTER);
   canvas.ellipse(xPos,yPos,w/(canvas.width/5),h/100);
   canvas.ellipse(circlePointX,circlePointY,w/(canvas.width/50), w/(canvas.height/50));
    canvas.line(xPos,yPos,circlePointX,circlePointY);
    
    for (int i = 1; i < 6; i++){
        float circlePointXx = random(circlePointX-(250), circlePointX+(250))+i;
  float circlePointYy = random(circlePointY-(250), circlePointY+(250))+i;
  
  
    canvas.line(circlePointX,circlePointY, circlePointXx, circlePointYy);
   canvas.ellipse(circlePointXx,circlePointYy,w/(canvas.width/50), w/(canvas.height/50));
    }

  }
}

