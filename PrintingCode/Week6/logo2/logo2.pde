Bacteria [] bacteriaAll = new Bacteria[50];


int h = 500;
int w = 200;
int petriW = 200;
int petriH = 200;

void setup() {
  size(510,660);
  background(255);

frameRate(2);
  
  PFont font;
// The font must be located in the sketch's 
// "data" directory to load successfully
font = loadFont("Arial-BoldMT-80.vlw");
textFont(font, 128);
}



void draw(){
  
      background(255);
 smooth();

 stroke(0,0,0,50);
 fill(255);
 //strokeWeight(16);
 //ellipse(width/2, height/2,petriW,petriH);
 strokeWeight(16);
 for (int i = 3; i < bacteriaAll.length; i ++){
   bacteriaAll[i] = new Bacteria((width/(2)+ random(-50,50)),height/(2)+ random(-100,100),(width/(2)+(i*2)-i),(height/(2)+(i*2)-i));
   
   fill(250, 50+(i/10), 100+i, 50);
   strokeWeight(1);
 stroke(250, 50+(i/10), 100+i, 50);
 bacteriaAll[i].display();
// ballCollection[i].move();
 }
 fill(0,0,0,50);
 text("nypl", width/2 - petriW/1.5, height/2 + petriW/5);
}




