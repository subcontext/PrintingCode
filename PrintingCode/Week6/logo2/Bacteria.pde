class Bacteria{
  float xPos;
  float yPos;
  float h;
   float w;
  color c;
  
  Bacteria(float _xPos, float _yPos, float _w, float _h){

    xPos = _xPos;
    yPos = _yPos;
    w = _w;
    h = _h;
    
    
  }
  
  void display(){
    
   float circlePointX = random(xPos-65,xPos+65);
   float circlePointY = random(yPos-65,yPos+65);
 float previousX = circlePointX;
 float previousY = circlePointY;

   rectMode(CENTER);
   ellipse(xPos,yPos,w/100,h/100);
   ellipse(circlePointX,circlePointY,w/100, w/100);
    line(xPos,yPos,circlePointX,circlePointY);
    
    for (int i = 1; i < 6; i++){
        float circlePointXx = random(circlePointX-25, circlePointX+25)+i;
  float circlePointYy = random(circlePointY-25, circlePointY+25)+i;
  
  
    line(circlePointX,circlePointY, circlePointXx, circlePointYy);
   ellipse(circlePointXx,circlePointYy,w/100, w/100);
    }

  }
}

