// P5Stafford
// osc send and recieve

import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int value1=0;
int value2=0;


void setup() {
  size(800, 800);
  background(0);
  
  oscP5 = new OscP5(this, 1234); //listen on this port for incoming
  //sending
  myRemoteLocation = new NetAddress("127.0.0.1", 12000); //send on this port - if you have it the same as the listrning we can test the send and recieve
}


void draw() {
  //background(0);
  fill(0,20);
  rect(0,0,width,height);
  
  noStroke();
  fill(255,value2/4,value1/4,90);
  ellipse(width/2,height/2,value1,value2);
}



void keyPressed() {
  if (key==' ') {
    saveFrame("imimg-###.jpg");
  } else 
  if (key=='m') {
    sendMessage();
  }
}




void oscEvent(OscMessage theOscMessage) {

  //println("### received an osc message. with address pattern "+theOscMessage.addrPattern());

//parsing

  if (theOscMessage.checkAddrPattern("/test")==true) {
    int firstValue = theOscMessage.get(0).intValue();  
    //int firstValue = theOscMessage.get(0).intValue();  
    println(theOscMessage.addrPattern()+ ": value: "+firstValue+" ");
    value1 = firstValue; //pass into global variable
    // return;
  }
  else 
  if (theOscMessage.checkAddrPattern("/maxmsp")==true) {
    //do soemthing else
    int msgValue = theOscMessage.get(0).intValue();  
    println(theOscMessage.addrPattern() + ": value:");
    value2 = msgValue;
    
  }
  
  
}






void sendMessage() {
  OscMessage myMessage = new OscMessage("/test");

  myMessage.add(123); /* add an int to the osc message */
  myMessage.add(12.34); /* add a float to the osc message */
  myMessage.add("some text"); /* add a string to the osc message */

  /* send the message */
  oscP5.send(myMessage, myRemoteLocation);
}