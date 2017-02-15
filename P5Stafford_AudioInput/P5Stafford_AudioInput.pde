// p5Stafford

import processing.sound.*;

AudioIn input;
Amplitude rms;

int scale=1;

void setup() {
  size(640, 360);
  background(255);

  //Create an Audio input and grab the 1st channel
  input = new AudioIn(this, 0);
  input.start();    // start the Audio Input
  rms = new Amplitude(this); // create a new Amplitude analyzer
  rms.input(input);    // Patch the input to an volume analyzer
}      


void draw() {
  background(125, 255, 125);
  scale=int(map(rms.analyze(), 0, 0.5, 1, 350));
  noStroke();
  fill(255, 0, 150);
  ellipse(width/2, height/2, scale, scale);
}


void keyPressed() {
  if (key==' ') {
    saveFrame("img-###.jpg");
  } else {
    //background(0);
  }
}