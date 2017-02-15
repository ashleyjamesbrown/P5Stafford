// P5Stafford
// osc send and recieve to maxmsp



void setup() {
  size(800, 800);
  background(0);
  
  setupOSC(); //call this to init the OSC and then whenever a message comes in out event will fire
 }


void draw() {
  //background(0);
  fill(0,20);
  rect(0,0,width,height);
  noStroke();
  fill(255,value2/4,value1/4,90);
  ellipse(width/2,height/2,value1,value2); //use our 2 values coming in from max
}



void keyPressed() {
  if (key==' ') {
    saveFrame("imimg-###.jpg");
  } else 
  if (key=='m') {
    sendMessage(); //this is to test if we can send back to maxmsp
  }
}