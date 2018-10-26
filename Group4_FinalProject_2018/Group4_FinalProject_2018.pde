import de.voidplus.leapmotion.*;
import beads.*;
import java.util.Arrays;
import ddf.minim.*;
import ddf.minim.ugens.*;


AudioContext ac;
AudioInput in;
AudioRecorder recorder;
Minim minim;
boolean recorded = false;
AudioOutput out;
FilePlayer player;

int stage = 1;
int buttonWidth = width*2;
int buttonHeight = height*2;
int startButtonX;
int startButtonY;
int aboutButtonX;
int aboutButtonY;
int backButtonX;
int backButtonY;
int instructionsButtonX;
int instructionsButtonY;
int filePathButtonY;



LeapMotion leap;
PVector handPosition;
boolean swipeOnorOff = true;
String swipeIs = "On";
boolean rectOver = false;
boolean rectOver_2 = false;
boolean rectOver_3 = false;
boolean rectOver_4 = false;
boolean rectOver_5 = false;

float xValues[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
float yValues[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};

float chimeWidth[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};
float chimeHeight[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};

float x= 100;
float y = height;
int W=1150;
int H=600;
int BARW=950;
int BARH=50;
int RECORDX=750;
int Y=500;
int PLAYX=750+150;
int maxAmount = 18; // defines the amount of chimes (can have more chimes that appear offscreen though
int chimeNumber[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23};


boolean isRecord=false;
boolean isPlay=false;

color white, black, buttonColor, buttonHighlight;

void setup()
{
  fullScreen();
  //size(1920, 1080); // use this if your screen is not 1080p
  background(255);
  startButtonX = width/2 - 300;
  startButtonY = height/2;
  aboutButtonX = width/2;
  aboutButtonY = height/2 - 300;
  backButtonX = 0;
  backButtonY = 0;
  instructionsButtonX = width/2 + 300;
  instructionsButtonY = height/2;
  filePathButtonY = height/2 + 300;

  leap = new LeapMotion(this).allowGestures(); 
  handPosition = new PVector();

  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);
  recorder = minim.createRecorder(in, "your_recording.wav");
  out = minim.getLineOut(Minim.STEREO);

  ac = new AudioContext();

  white=color(255);
  black=color(120);
  buttonColor=color(211);
  buttonHighlight=color(100);
}

void soundFilePath(File selection) {
  if (selection != null) {
    filePath = selection.getAbsolutePath();
    filePath = filePath + "\\";
  } else {
    selectFolder("Please Select Your Folder That Contain The Chime Sounds:", "soundFilePath");
  }
}



void draw()
{

  //println(buttonWidth);
  //println(mouseX);
  if (mouseX >= (startButtonX - buttonWidth)  & mouseX <= (startButtonX + buttonWidth) & mouseY >=(startButtonY-buttonHeight) & mouseY <=(startButtonY+buttonHeight)
    ) {
    rectOver = true;
  } else {
    rectOver = false;
  }

  if (mouseX >= (aboutButtonX - buttonWidth)  & mouseX <= (aboutButtonX + buttonWidth) & mouseY >=(aboutButtonY-buttonHeight) & mouseY <=(aboutButtonY+buttonHeight)
    ) {
    rectOver_2 = true;
  } else {
    rectOver_2 = false;
  }

  if (mouseX >= (backButtonX - buttonWidth)  & mouseX <= (backButtonX + buttonWidth) & mouseY >=(backButtonY-buttonHeight) & mouseY <=(backButtonY+buttonHeight)) {
    if (stage == 2 || stage == 3 || stage == 4) {
      rectOver_3 = true;
    }
  } else {

    rectOver_3 = false;
  }

  if (handPosition.x >= (instructionsButtonX - buttonWidth) & handPosition.x <=(instructionsButtonX+ buttonWidth) & handPosition.y >=(instructionsButtonY-buttonHeight) & handPosition.y <=(instructionsButtonY+buttonHeight) ||
    mouseX >= (instructionsButtonX - buttonWidth)  & mouseX <= (instructionsButtonX + buttonWidth) & mouseY >=(instructionsButtonY-buttonHeight) & mouseY <=(instructionsButtonY+buttonHeight)
    ) {
    rectOver_4 = true;
  } else {
    rectOver_4 = false;
  }

  if (mouseX >= (aboutButtonX - buttonWidth)  & mouseX <= (aboutButtonX + buttonWidth) & mouseY >=(filePathButtonY-buttonHeight) & mouseY <=(filePathButtonY+buttonHeight)
    ) {
    rectOver_5 = true;
  } else {
    rectOver_5 = false;
  }





  if (stage==1) {

    background(255);



    textSize(32);
    textAlign(CENTER, CENTER);
    rectMode(CENTER);

    if (rectOver) {

      fill(color(0, 0, 255));
    } else {
      fill(255);
    }

    rect(startButtonX, startButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("Start", startButtonX, startButtonY);


    if (rectOver_2) {

      fill(color(255, 255, 0));
    } else {
      fill(255);
    }
    rect(aboutButtonX, aboutButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("About", aboutButtonX, aboutButtonY);

    if (rectOver_5) {

      fill(color(224, 224, 224));
    } else {
      fill(255);
    }
    rect(width/2, filePathButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("Add Sounds", width/2, filePathButtonY);

    if (rectOver_4) {

      fill(color(255, 0, 0));
    } else {
      fill(255);
    }
    rect(instructionsButtonX, instructionsButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    text("Instructions", instructionsButtonX, instructionsButtonY);
  }

  if (stage==2) {

    background(255);

    rectMode(CORNER);
    if (rectOver_3) {

      fill(color(192, 192, 192));
    } else {
      fill(255);
    }
    rect(backButtonX, backButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    textAlign(CENTER, CENTER);
    text("BACK", buttonWidth/2, buttonHeight/2);

    float m=0.5; //change this to move chimes across the width of the screen
    float n=5.25;
    float d=0;
    float b=height/14;
    float c=width/6;



    strokeWeight(3);
    stroke(0);
    fill(150, 111, 51);
  rect (displayWidth*20/1080, height/4, maxAmount*displayWidth*x/1920, displayHeight*50/1080); // wooden bar rectangle



    for (int i=0; i<maxAmount; i++)
    {
      //strokeWeight();
      stroke(0);
      line (b+d, c, b+d, c*1.30); //string connecting to chime    
    d=d+displayWidth*100/1920; //the number value here changes the width between the strings


      fill(192, 192, 192);
      noStroke();
    rect (displayWidth*x/1920*m, height*10/27, displayWidth*x/2/1920, displayHeight*n*x/1080); //chimes    

      xValues[i] = displayWidth*x/1920*m;    
      yValues[i] = height*10/27;

      chimeWidth[i] = displayWidth*x/2/1920;
      chimeHeight[i] =  displayHeight*n*x/1080;

      m++;
      n=n-0.2;
      chimeNumber[i] = i;
    }




    if (leap.getHands().size()>0) { //if more than 1 hand
      handPosition=leap.getHands().get(0).getStabilizedPosition();
    }//get hand position
    strokeWeight(2.5);
    stroke(0);
    fill(255, 0, 0);
    ellipse(handPosition.x, handPosition.y, 30, 30);

    textSize(32);
    fill(0);
    text("Press 's' to turn swipe mode on or off, Swipe Mode is: " + swipeIs, width/2, height/1.10);

    if ( recorder.isRecording() )
    {
      text("Now recording, press the 'r' key to stop recording", width/3.5, height/6);
    } else if (!recorded)
    {
      text("Press the 'r' key to start recording", width/3, height/6);
    } else
    {
      text("Press the 'a' key to save the recording to disk and play it back or Press the 'n' key for a new recording", width/15.7, height/6);
    }

   //Interaction();
    
  }

  if (stage==3) {
    background(255);

    rectMode(CORNER);
    if (rectOver_3) {

      fill(color(192, 192, 192));
    } else {
      fill(255);
    }
    rect(backButtonX, backButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    textAlign(CENTER, CENTER);
    text("BACK", buttonWidth/2, buttonHeight/2);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Interactive virtual Mark Tree Created in Processing by Kian Southgate © 2018", width/2, height/2);
  }

  if (stage == 4) {
    background(255);

    if (rectOver_3) {

      fill(color(192, 192, 192));
    } else {
      fill(255);
    }
    rectMode(CORNER);
    rect(backButtonX, backButtonY, buttonWidth, buttonHeight, 7);
    fill(0);
    textAlign(CENTER, CENTER);
    text("BACK", buttonWidth/2, buttonHeight/2);
  }
}

void mouseClicked() {
  if (rectOver == true && filePath != null) {
    stage =2;
  } else if (filePath == null && rectOver==true) {
    selectFolder("Please Select Your Folder That Contain The Chime Sounds and Then Press Start", "soundFilePath");
    
  }

  if (rectOver_2 == true) {
    stage =3;
  }

  if (rectOver_3 == true) {
    stage=1;
  }

  if (rectOver_4 == true) {
    stage = 4;
  }

  if (rectOver_5 == true) {
    selectFolder("Please Select Your Folder That Contain The Chime Sounds and Then Press Start", "soundFilePath");
  }
  
 
}




void keyPressed() {
  background(255);
  if (key=='s') {
    if (swipeOnorOff == false) {
      swipeOnorOff = true;
      swipeIs = "On";
      println("swipe is on");
    } else if (swipeOnorOff == true) {
      swipeOnorOff = false;
      swipeIs = "Off";
      println("swipe is off");
    }
  }

  if (!recorded && key == 'r')
  {
    if (recorder.isRecording())
    {
      recorder.endRecord();
      recorded = true;
    } else
    {
      recorder.beginRecord();
    }
  }

  if (recorded && key == 'a')
  {
    if (player != null)
    {
      player.unpatch(out);
      player.close();
    }
    player = new FilePlayer(recorder.save());
    player.patch(out);
    player.play();
  }

  if (recorded && key == 'n') {
    recorded = false;
    recorder = minim.createRecorder(in, "your_recording.wav");
  }
}








void leapOnCircleGesture(CircleGesture g, int state) {
println("you circle");

switch(state){
case 1:
  break;
case 2:
  break;
case 3:
 if (handPosition.x >=(xValues[0]-chimeWidth[0]) && handPosition.x <=(xValues[0]+chimeWidth[0]) & handPosition.y >=(yValues[0]-chimeHeight[0]) && handPosition.y <=(yValues[0]+chimeHeight[0])) {
    sound(22);
  } else if (handPosition.x >=(xValues[1]-chimeWidth[1]) && handPosition.x <=(xValues[1]+chimeWidth[1]) & handPosition.y >=(yValues[1]-chimeHeight[1]) && handPosition.y <=(yValues[1]+chimeHeight[1])) {
    sound(21);
  } else if (handPosition.x >=(xValues[2]-chimeWidth[2]) && handPosition.x <=(xValues[2]+chimeWidth[2]) & handPosition.y >=(yValues[2]-chimeHeight[2]) && handPosition.y <=(yValues[2]+chimeHeight[2]) ) {
    sound(20);
  } else  if (handPosition.x >=(xValues[3]-chimeWidth[3]) && handPosition.x <=(xValues[3]+chimeWidth[3]) & handPosition.y >=(yValues[3]-chimeHeight[3]) && handPosition.y <=(yValues[3]+chimeHeight[3]) ) {
    sound(19);
  } else if (handPosition.x >=(xValues[4]-chimeWidth[4]) && handPosition.x <=(xValues[4]+chimeWidth[4]) & handPosition.y >=(yValues[4]-chimeHeight[4]) && handPosition.y <=(yValues[4]+chimeHeight[4]) ) {
    sound(18);
  } else if (handPosition.x >=(xValues[5]-chimeWidth[5]) && handPosition.x <=(xValues[5]+chimeWidth[5]) & handPosition.y >=(yValues[5]-chimeHeight[5]) && handPosition.y <=(yValues[5]+chimeHeight[5])  ) {
    sound(17);
  } else if (handPosition.x >=(xValues[6]-chimeWidth[6]) && handPosition.x <=(xValues[6]+chimeWidth[6]) & handPosition.y >=(yValues[6]-chimeHeight[6]) && handPosition.y <=(yValues[6]+chimeHeight[6]) ) {
    sound(16);
  } else if (handPosition.x >=(xValues[7]-chimeWidth[7]) && handPosition.x <=(xValues[7]+chimeWidth[7]) & handPosition.y >=(yValues[7]-chimeHeight[7]) && handPosition.y <=(yValues[7]+chimeHeight[7]) ) {
    sound(15);
  } else if (handPosition.x >=(xValues[8]-chimeWidth[8]) && handPosition.x <=(xValues[8]+chimeWidth[8]) & handPosition.y >=(yValues[8]-chimeHeight[8]) && handPosition.y <=(yValues[8]+chimeHeight[8])) {
    sound(14);
  } else if (handPosition.x >=(xValues[9]-chimeWidth[9]) && handPosition.x <=(xValues[9]+chimeWidth[9]) & handPosition.y >=(yValues[9]-chimeHeight[9]) && handPosition.y <=(yValues[9]+chimeHeight[9]) ) {
    sound(13);
  } else if (handPosition.x >=(xValues[10]-chimeWidth[10]) && handPosition.x <=(xValues[10]+chimeWidth[10]) & handPosition.y >=(yValues[10]-chimeHeight[10]) && handPosition.y <=(yValues[10]+chimeHeight[10]) ) {
    sound(12);
  } else  if (handPosition.x >=(xValues[11]-chimeWidth[11]) && handPosition.x <=(xValues[11]+chimeWidth[11]) & handPosition.y >=(yValues[11]-chimeHeight[11]) && handPosition.y <=(yValues[11]+chimeHeight[11]) ) {
    sound(11);
  } else  if (handPosition.x >=(xValues[12]-chimeWidth[12]) && handPosition.x <=(xValues[12]+chimeWidth[12]) & handPosition.y >=(yValues[12]-chimeHeight[12]) && handPosition.y <=(yValues[12]+chimeHeight[12])) {
    sound(10);
  } else if (handPosition.x >=(xValues[13]-chimeWidth[13]) && handPosition.x <=(xValues[13]+chimeWidth[13]) & handPosition.y >=(yValues[13]-chimeHeight[13]) && handPosition.y <=(yValues[13]+chimeHeight[13])) {
    sound(9);
  } else if (handPosition.x >=(xValues[14]-chimeWidth[14]) && handPosition.x <=(xValues[14]+chimeWidth[14]) & handPosition.y >=(yValues[14]-chimeHeight[14]) && handPosition.y <=(yValues[14]+chimeHeight[14])) {
    sound(8);
  } else if (handPosition.x >=(xValues[15]-chimeWidth[15]) && handPosition.x <=(xValues[15]+chimeWidth[15]) & handPosition.y >=(yValues[15]-chimeHeight[15]) && handPosition.y <=(yValues[15]+chimeHeight[15])) {
    sound(7);
  } else if (handPosition.x >=(xValues[16]-chimeWidth[15]) && handPosition.x <=(xValues[16]+chimeWidth[16]) & handPosition.y >=(yValues[16]-chimeHeight[15]) && handPosition.y <=(yValues[16]+chimeHeight[16])) {
    sound(6);
  } else if (handPosition.x >=(xValues[17]-chimeWidth[17]) && handPosition.x <=(xValues[17]+chimeWidth[17]) & handPosition.y >=(yValues[17]-chimeHeight[17]) && handPosition.y <=(yValues[17]+chimeHeight[17])) {
    sound(5);
  } else if (handPosition.x >=(xValues[18]-chimeWidth[18]) && handPosition.x <=(xValues[18]+chimeWidth[18]) & handPosition.y >=(yValues[18]-chimeHeight[18]) && handPosition.y <=(yValues[18]+chimeHeight[18])) {
    sound(4);
  } else if (handPosition.x >=(xValues[19]-chimeWidth[19]) && handPosition.x <=(xValues[19]+chimeWidth[19]) & handPosition.y >=(yValues[19]-chimeHeight[19]) && handPosition.y <=(yValues[19]+chimeHeight[19])) {
    sound(3);
  } else if (handPosition.x >=(xValues[20]-chimeWidth[20]) && handPosition.x <=(xValues[20]+chimeWidth[20]) & handPosition.y >=(yValues[20]-chimeHeight[20]) && handPosition.y <=(yValues[20]+chimeHeight[20])) {
    sound(2);
  } else if (handPosition.x >=(xValues[21]-chimeWidth[21]) && handPosition.x <=(xValues[21]+chimeWidth[21]) & handPosition.y >=(yValues[21]-chimeHeight[21]) && handPosition.y <=(yValues[21]+chimeHeight[21])) {
    sound(1);
  } else if (handPosition.x >=(xValues[22]-chimeWidth[22]) && handPosition.x <=(xValues[22]+chimeWidth[22]) & handPosition.y >=(yValues[22]-chimeHeight[22]) && handPosition.y <=(yValues[22]+chimeHeight[22])) {
    sound(0);
  }
  break;
}

 
}

void leapOnSwipeGesture(SwipeGesture g, int state) {

  println("you swiped");
  if (swipeOnorOff == true) {
    switch(state) {
    case 1: // Start
      break;
    case 2: // Update
      break;
    case 3: // Stop
      if (handPosition.x >=0 && handPosition.x <=width/2) {
        glissandoLowtoHigh();
      } else if (handPosition.x >=width/2 && handPosition.x <=width) {
        glissandoHightoLow();
      }
      break;
    }
  }
}
