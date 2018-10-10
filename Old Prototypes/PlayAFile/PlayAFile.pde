import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;

AudioInput in;
AudioRecorder recorder;
boolean recorded;

AudioOutput out;
FilePlayer player;

AudioPlayer player1;
AudioPlayer player2;
AudioPlayer player3;
AudioPlayer player4;
AudioPlayer player5;
AudioPlayer player6;
AudioPlayer player7;
AudioPlayer player8;
AudioPlayer player9;
AudioPlayer player10;

PImage Image;
final int W=1150;
final int H=600;

void setup()
{
  size(1150,600);
  Image = loadImage("bg.jpg");
  
  minim = new Minim(this);
  
  recorder = minim.createRecorder(in, "myrecording.wav");
  
  player1 = minim.loadFile("10.wav");
  player2 = minim.loadFile("9.wav");
  player3 = minim.loadFile("8.wav");
  player4 = minim.loadFile("7.wav");
  player5 = minim.loadFile("6.wav");
  player6 = minim.loadFile("5.wav");
  player7 = minim.loadFile("4.wav");
  player8 = minim.loadFile("3.wav");
  player9 = minim.loadFile("2.wav");
  player10 = minim.loadFile("1.wav");

}

void draw()
{
  Image.resize(1150,600);
  image(Image,0,0);
  noLoop();
  float x=100;
  
  float m=1;
  float n=3;
  float d=0;
  
  fill(150, 111, 51);
  rect (x, x/2,9.5*x,x/2);
  
  for(int i=0;i<10;i++)
  {
    line (125+d,x,125+d,2*x);
    d=d+100;
    fill(240);
    rect (x*m, 2*x,x/2,n*x);
    m++;
    n=n-0.2;
  }

  for (int i=0;i<2;i++)
  {
    fill(211,211,211);
    rect(750+d, 500, 120, 60, 15);
    d=d+175;
  }
    fill(255,0,0);
    ellipse(810, 530, 30, 30);
    fill(87);
    //rect(945,515,30,30);
    fill(87);
    triangle(1095-100-25,515,1095-100-25,545,1125-100-25,530);
    //triangle(1095,515,1095,545,1125,530);
    


  if ( !recorded )
  {
    text("Press the r key to start recording.", 5, 15);
  }
  else
  {
    text("Press the s key to save the recording to disk and play it back in the sketch.", 5, 15);
  }
}
  


void mouseMoved()
{
  if(mouseX > 125 && mouseX < 130 && mouseY > 100 && mouseY < 500)
  {
    player1.rewind();
    player1.play();
  }
  
  if(mouseX > 225 && mouseX < 230 && mouseY > 100 && mouseY < 480)
  {

    player2.rewind();
    player2.play();
  }
  
  if(mouseX > 325 && mouseX < 330 && mouseY > 100 && mouseY < 460)
  {

    player3.rewind();
    player3.play();
  }
  
  if(mouseX > 425 && mouseX < 430 && mouseY > 100 && mouseY < 440)
  {

    player4.rewind();
    player4.play();
  }
  
  if(mouseX > 525 && mouseX < 530 && mouseY > 100 && mouseY < 420)
  {

    player5.rewind();
    player5.play();
  }
  
  if(mouseX > 625 && mouseX < 630 && mouseY > 100 && mouseY < 420)
  {

   player6.rewind();
   player6.play();
  }
  
  if(mouseX > 725 && mouseX < 730 && mouseY > 100 && mouseY < 380)
  {

    player7.rewind();
    player7.play();
  }
  
  if(mouseX > 825 && mouseX < 830 && mouseY > 100 && mouseY < 360)
  {

    player8.rewind();
    player8.play();
  }
  
  if(mouseX > 925 && mouseX < 930 && mouseY > 100 && mouseY < 340)
  {

    player9.rewind();
    player9.play();
  }
  
  if(mouseX > 1025 && mouseX < 1030 && mouseY > 100 && mouseY < 320)
  {

    player10.rewind();
    player10.play();
  }
  
}

void keyReleased()
{
  if ( !recorded && key == 'r' ) 
  {
    // to indicate that you want to start or stop capturing audio data, 
    // you must callstartRecording() and stopRecording() on the AudioRecorder object. 
    // You can start and stop as many times as you like, the audio data will 
    // be appended to the end of to the end of the file. 
    if ( recorder.isRecording() ) 
    {
      recorder.endRecord();
      recorded = true;
    }
    else 
    {
      recorder.beginRecord();
    }
  }
  if ( recorded && key == 's' )
  {
    // we've filled the file out buffer, 
    // now write it to a file of the type we specified in setup
    // in the case of buffered recording, 
    // this will appear to freeze the sketch for sometime, if the buffer is large
    // in the case of streamed recording, 
    // it will not freeze as the data is already in the file and all that is being done
    // is closing the file.
    // save returns the recorded audio in an AudioRecordingStream, 
    // which we can then play with a FilePlayer
    if ( player != null )
    {
        player.unpatch( out );
        player.close();
    }
    player = new FilePlayer( recorder.save() );
    player.patch( out );
    player.play();
  }
}
