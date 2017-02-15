import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

int value1=0;
int value2=0;


void setupOSC() {
  oscP5 = new OscP5(this, 1234); //listen on this port for incoming - please match the 1234 with maxmsp
  //sending
  myRemoteLocation = new NetAddress("127.0.0.1", 8080); //send on this port and ip - can use localhost to route to same machine
}


//whenever we get a message this code is triggered as an event
void oscEvent(OscMessage theOscMessage) {
  //println("### received an osc message. with address pattern "+theOscMessage.addrPattern());

  //parsing the messages and getting the values out and into our global variables
  if (theOscMessage.checkAddrPattern("/test")==true) {
    int firstValue = theOscMessage.get(0).intValue();  
    //int firstValue = theOscMessage.get(0).intValue();  
    println(theOscMessage.addrPattern()+ ": value: "+firstValue+" ");
    value1 = firstValue; //pass into global variable
  } else 
  if (theOscMessage.checkAddrPattern("/maxmsp")==true) {
    //do soemthing else
    int msgValue = theOscMessage.get(0).intValue();  
    println(theOscMessage.addrPattern() + ": value:");
    value2 = msgValue;
  }
  //
  // else another if statement for another message addr pattern to check
  //
  //
}






void sendMessage() {
  OscMessage myMessage = new OscMessage("/test"); //this is the message addr pattern
  myMessage.add(123); /* add an int to the osc message */

  /* actually send the message */
  oscP5.send(myMessage, myRemoteLocation);
}