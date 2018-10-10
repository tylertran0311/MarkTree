/*Bind the pitches to the virtual bars/chimes and ensure that each single chime makes a sound dependent on pitch. - Samuel Li 13381316
*/

import beads.*;
AudioContext ac;
  int value=0;
void setup() {
  size(500,500);
ac = new AudioContext();
background(255);
} 

  void draw(){
  
  }
  

//Input of the chimes
//Demo uses keys to play the sound of the chime
//The number of keys relate to other memebers parts
void keyPressed() {
  if (key=='1'){
    fill(153);
    //file
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/1.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    //Audio settings
    //Pitch of the sound
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    //Buffer of the sound
    //Creates echo sound effect when interacted
TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
   //output player
     Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  else
   fill(255);
  
  if (key=='2'){
    
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/2.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 

     Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
  if (key=='3'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/3.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
       Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
 if (key=='4'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/4.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
     Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
  if (key=='5'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/5.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
      Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
  if (key=='6'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/6.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
        Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
  if (key=='7'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/7.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
         Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
  if (key=='8'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/8.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
     Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
  if (key=='9'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/9.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
        Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
  
  if (key=='0'){
    String audioFile="/Users/samuelli/Desktop/Assessment_2_sound/New charm sound/10.wav";
    SamplePlayer player= new SamplePlayer(ac,SampleManager.sample(audioFile));
    Envelope rate=new Envelope(ac,0.5);
    player.setRate(rate);
    TapIn in = new TapIn(ac, 1000);
  TapOut out = new TapOut(ac, in, 150);
  Gain gDelay = new Gain(ac, 2, 0.8);
  gDelay.addInput(out);
  in.addInput(gDelay);
  in.addInput(player);
 
 
        Panner p=new Panner(ac,2);
     Gain g=new Gain (ac,2,0.5);
     g.addInput(p);
  g.addInput(player);
  p.addInput(out);
  ac.out.addInput(g);
  ac.start();
  }
   
  }
