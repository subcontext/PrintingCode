PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 6600;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;


void setup() 
{
  size(510, 660);

  PFont font;
  // The font must be located in the sketch's 
  // "data" directory to load successfully
  font = loadFont("Arial-BoldMT-80.vlw"); 


  //CANVAS CONVERSION
  canvas = createGraphics(canvas_width, canvas_height, P2D);
  calculateResizeRatio();

  canvas.beginDraw();

  canvas.background(255);
  canvas.smooth();
  canvas.strokeWeight(2);
  canvas.fill(30);
  float g= 50; //GutterSize variable


  ModularGrid grid = new ModularGrid(4, 6, g, 200);
  
   Module startModuleBG = grid.modules[0][0];
  canvas.smooth();
  for (float i = 0; i < 100; i++)
  {
    canvas.noFill();
    canvas.stroke(0);
    canvas.rect((startModuleBG.x + startModuleBG.w/2)+i, (startModuleBG.y + startModuleBG.h/2)+i, startModuleBG.w+i, startModuleBG.h+i);

     canvas.fill(255);
     canvas.noStroke();
    canvas.rect(((startModuleBG.x + startModuleBG.w/2) +i) +50, ((startModuleBG.y + startModuleBG.h/2) +50)+i, startModuleBG.w+i, startModuleBG.h+i);
  }
  
  
  
  Module startModule = grid.modules[2][2];
  canvas.smooth();
  for (float i = 0; i < startModule.w; i++)

  {
    canvas.fill(100);
    canvas.rect(startModule.x, startModule.y, startModule.w, startModule.h);

    canvas.fill(0, 0, 0, i*20);
    canvas.rect((startModule.x+i)+i*.05, (startModule.y+i) +i*.05, startModule.w, startModule.h);
  }


  Module startModule2 = grid.modules[2][5];
  for (float j = 0; j < startModule.w; j++)
  {
    canvas.fill(100);
    canvas.rect(startModule2.x, startModule2.y, startModule2.w, startModule2.h);
    canvas.fill(0, 0, 0, j*20);
    canvas.rect((startModule.x-j)-j*.05, (startModule2.y-j)-j*.05, startModule2.w, startModule2.h);
  }


  canvas.textAlign(RIGHT);
  canvas.textFont(font, 800); 


  // draw some text in the modular grid
  canvas.smooth();
  String gLetter = "G";
  Module startModuleG = grid.modules[2][0];

  // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
  canvas.fill(0, 0, 0, 100);
  canvas.text(gLetter, startModuleG.x, startModuleG.y - (startModuleG.h/2), startModuleG.w, startModuleG.h);

  String e = "E";
  Module startModuleE = grid.modules[2][0];
  // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
  canvas.fill(0, 0, 0, 100);
  canvas.text(e, startModuleE.x, startModuleE.y  + (startModuleG.h/2), startModuleE.w, startModuleE.h);

  String s = "S";
  Module startModuleS = grid.modules[2][1];
  // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
  canvas.fill(0, 0, 0, 100);
  canvas.text(s, startModuleS.x, startModuleS.y + (startModuleG.h/2), startModuleS.w, startModuleS.h);

  canvas.textAlign(RIGHT);
  String t = "T";
  Module startModuleT = grid.modules[2][2];

  // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
  canvas.fill(0, 0, 0, 100);
  canvas.text(t, startModuleT.x, startModuleT.y + (startModuleG.h/2), startModuleT.w, startModuleT.h);

  String a = "A";
  Module startModuleA = grid.modules[2][3];

  // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
  canvas.fill(0, 0, 0, 100);
  canvas.text(a, startModuleA.x, startModuleA.y + (startModuleG.h/2), startModuleA.w, startModuleA.h);

  String l = "L";
  Module startModuleL = grid.modules[2][4];

  // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
  canvas.fill(0, 0, 0, 100);
  canvas.text(l, startModuleL.x, startModuleL.y + (startModuleG.h/2), startModuleL.w, startModuleL.h);

  Module startModuleTt = grid.modules[2][5];

  // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
  canvas.fill(0, 0, 0, 100);
  canvas.text(t, startModuleTt.x, startModuleTt.y + (startModuleG.h/2), startModuleTt.w, startModuleTt.h);

  /*

   String o = "O";
   Module startModuleO = grid.modules[1][2];
   
   // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
   canvas.fill(0);
   canvas.text(o, startModuleO.x, startModuleO.y, startModuleO.w, startModuleO.h);
   
   String n = "N";
   Module startModuleN = grid.modules[2][2];
   
   // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
   canvas.fill(0);
   canvas.text(n, startModuleN.x, startModuleN.y, startModuleN.w, startModuleN.h);
   
   
   
   String x = "X";
   Module startModuleX = grid.modules[2][3];
   
   // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
   canvas.fill(0);
   canvas.text(x, startModuleX.x, startModuleX.y, startModuleX.w, startModuleX.h);
   
   
   Module startModuleTt = grid.modules[3][3];
   
   // lets fill the rectangle with text. As you can see, Processing leaves a lot to be desired about text rendering
   canvas.fill(0);
   canvas.text(t, startModuleTt.x, startModuleTt.y, startModuleTt.w, startModuleTt.h);
   */

  canvas.save("grid4.tiff");
}

void draw()
{
  ModularGrid grid = new ModularGrid(4, 6, 50, 200);
  Module startModule = grid.modules[0][0];


  if (keyPressed) 
  {
    if (key == 'a')
    {
      grid.display();

      canvas.save("grid4_grid.tiff");
    }
  }


  canvas.endDraw();

  //RESIZE
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
}

void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}



