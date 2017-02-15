// P5STafford
// image loading

PImage myImage;

void setup() {
  size(800, 600);
  background(0);
  myImage=loadImage("pops.png");
}


void draw(){
  image(myImage,width/2,height/2); //mouseX,mouseY
}

void keyPressed() {
  if (key==' ') {
    saveFrame("myScreen-###.jpg");
  }
}