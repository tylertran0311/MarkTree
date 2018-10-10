import beads.*;
import java.util.Arrays;
import ddf.minim.*;
import ddf.minim.ugens.*;

//int i;

AudioContext ac;
float px;
float py;
int pointSize = 20;

float bx;
float by;
int buttonSize = 30;

float cx;
float cy;
int resetSize = 30;

Minim minim;

AudioInput in;
AudioRecorder recorder;
boolean recorded = false;
AudioOutput out;
FilePlayer player;

boolean overPoint = false;
boolean plocked = false;
boolean overButton = false;

float xOffset = 0.0;
float yOffset = 0.0;

void setup()
{
  size(400,400);
  
  px = width/2.0;
  py = height/2.0;
  bx = width*4.0/5.0;
  by = height*4.0/5.0;
  cx = width/5.0;
  cy = height*4.0/5.0;
  
  ellipseMode(CENTER);
  colorMode(RGB);
  
  //for(i=0;i<999;i++)
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048);
  recorder = minim.createRecorder(in,"demo.wav");
  out = minim.getLineOut(Minim.STEREO);
  
  ac = new AudioContext();
}

void mousePressed()
{
  if(overPoint)
  {
    noStroke();
    fill(255,255,0);
    ellipse(px,py,pointSize,pointSize);
  } else if(overButton)
    {
      sound();
    } 
    else
    {
      plocked = false;
    }
  xOffset = mouseX-px;
  xOffset = mouseY-py;
}

void mouseDragged()
{
  if(!plocked)
  {
    noStroke();
    fill(255,255,0);
    ellipse(px,py,pointSize,pointSize);
    px = mouseX-xOffset;
    py = mouseY-yOffset;
  }
}

void mouseReleased()
{
  plocked = false;
}

void sound()
{
  float cf = map(px, 0, width, 180, 400);
  float harmonicityRatio =  map(py, 0, height, 1, 4);
  
  Glide carrierFreq = new Glide(ac,cf);
  Envelope modulationIndex = new Envelope(ac, 0.0);
  WavePlayer freqModulator = new WavePlayer(ac, cf * harmonicityRatio, Buffer.SINE);
  
  Function function = new Function(carrierFreq, freqModulator, modulationIndex)
  {
    public float calculate() 
    {
      return x[1] * (x[0] * x[2]) + x[0];
    }
  };
  
 
  WavePlayer wp = new WavePlayer(ac, function, Buffer.SINE);
  Envelope e1 = new Envelope(ac, 0);
   e1.addSegment(0.5,5);
   modulationIndex.addSegment(6.0,5);
   e1.addSegment(0.1,50);
    modulationIndex.addSegment(2.0,50);
   e1.addSegment(0.1,1000);
    modulationIndex.addSegment(0.2,1000);
   e1.addSegment(0.0,1000);
   modulationIndex.addSegment(0.0,1000);
  beads.Gain g = new beads.Gain(ac, 1, e1);
   
  g.addInput(wp);
  ac.out.addInput(g);
  ac.start();
}

void keyReleased()
{
  if(!recorded && key == 'r')
  {
    if(recorder.isRecording())
    {
      recorder.endRecord();
      recorded = true;
    } 
    else
    {
      recorder.beginRecord();
    }
  }
  
  if(recorded && key == 's')
  {
    if(player != null)
    {
      player.unpatch(out);
      player.close();
    }
    player = new FilePlayer(recorder.save());
    player.patch(out);
    player.play();
  }
}

void draw()
{
  background(0);
  fill(255);
  textSize(15);
  float cafreq = map(px, 0, width, 180, 400);
  String scafreq = nf(cafreq,3,2);
  text("CarrierFreq:" + scafreq, width/3, height*4/5);
  float haRatio = map(py, 0, height, 1, 4);
  String shaRatio = nf(haRatio,1,2);
  text("HarmonicityRatio:" + shaRatio, width/3, height*5/6);
  fill(255);
  textSize(15);
  text("Replay", width*3/4, height*7/8);
  noFill();
  
  if(mouseX>px-pointSize && mouseX<px+pointSize && 
  mouseY>py-pointSize && mouseY<py+pointSize)
  {
    overPoint = true;
    if(!plocked)
    {
      noStroke();
      fill(255,255,0);
      ellipse(px,py,pointSize,pointSize);
    }
  } else 
    {
     noStroke();
     fill(255,0,0);
     ellipse(px,py,pointSize,pointSize);
     overPoint = false;
    }
  
  
 if(mouseX>bx-buttonSize && mouseX<bx+buttonSize && 
    mouseY>by-buttonSize && mouseY<by+buttonSize)
  {
    overButton = true;
    noStroke();
    fill(224);
  } else 
    {
     noStroke();
     fill(160);
     overButton = false;
    }
  ellipse(bx,by,buttonSize,buttonSize);
  
  fill(255);
  ellipse(cx,cy,resetSize,resetSize);
  
  if ( recorder.isRecording() )
  {
    text("Now recording, press the r key to stop recording.", 5, 15);
  }
  else if(!recorded)
  {
    text("Press the r key to start recording.", 5, 15);
  }
  else
  {
    text("Press the s key to save the recording to disk and play it back.", 5, 15);
  } 
}
