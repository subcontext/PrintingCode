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
    
   
 
   rectMode(CENTER);
    ellipse(xPos,yPos,w,h);
    
 
  

  }
}

