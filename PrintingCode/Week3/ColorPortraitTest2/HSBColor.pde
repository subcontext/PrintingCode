// This is a simple class I made that holds the values of an HSB color
class HSBColor
{
  int h;
  int s;
  int b;
  
  HSBColor()
  {
    h = round(random(360));
    s = round(random(100));
    b = round(random(100)); 
  }
  
  HSBColor(int _h, int _s, int _b)
  {
    h = _h;
    s = _s;
    b = _b; 
    println("creating: " + h + " " + s + " " + b);
  }
  
  HSBColor(float _h, float _s, float _b)
  {
    h = round(_h);
    s = round(_s);
    b = round(_b);
  }
  
  void display(float x, float y, float x2, float y2, float x3, float y3)
  {
    canvas.noStroke();
    canvas.fill(h, s, b);
    canvas.triangle(x, y, x2, y2, x3, y3); 
  }
  
  void display2(int x, int y, int wi, float he)
  {
    canvas.stroke(h, s, b);
    canvas.noFill();
    canvas.rect(x, y, wi, he); 
  }
  
  
  void display3(int x, int y, int wi, float he)
  {
   canvas.stroke(h, s, b);
    canvas.noFill();
    canvas.ellipse(x, y, wi, he); 
     } 
  }



