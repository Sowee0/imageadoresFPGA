PImage background, foreground;
PGraphics mask;


void setup(){
  
  size(1920,1080);
  background = loadImage("bioshock_base.png");
  foreground = loadImage("bioshock_100blur.png");
  
  mask = createGraphics(512,512);
  
   mask.beginDraw();
  mask.background(0);
  mask.ellipse(0,0,100,100);
  mask.endDraw();
 
  
  
}

void draw(){
  
  
  //image(background, 0,0);
  foreground.mask(mask);
  image(foreground,0,0);
  
}
