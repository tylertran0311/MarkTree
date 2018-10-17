PImage img;
PImage woodImg;
final float x= width;
final float y = height;
final int W=1150;
final int H=600;
final int BARW=950;
final int BARH=50;
final int RECORDX=750;
final int Y=500;
final int PLAYX=750+150;
final int maxAmount = 18; // defines the amount of chimes (can have more chimes that appear offscreen though


boolean isRecord=false;
boolean isPlay=false;

color white,black, buttonColor,buttonHighlight;

void setup()
{
  fullScreen();
  //background(0,255,255);
  //img=loadImage("1.jpg");
  //woodImg = loadImage("wood1.jpg");
  //setupImg();
  
  white=color(255);
  black=color(120);
  buttonColor=color(211);
  buttonHighlight=color(100);
}

void draw()
{
  //noLoop();
//println(mouseX, mouseY);
  
  float m=0.5; //change this to move chimes across the width of the screen
  float n=4;
  float d=0;
  float b=height/14;
  float c=width/6;
 

  fill(150, 111, 51);
  rect (20, height/4,maxAmount*x,x/2); // wooden bar rectangle
  //image(woodImg,100,50,BARW,BARH);
  
  
  for(int i=0;i<maxAmount;i++)
  {
    stroke(0);
    line (b+d,c,b+d,c*1.30); //string connecting to chime
    //line (20,height/4, );
    d=d+100; //the number value here changes the width between the strings
    
    fill(255);
    noStroke();
    rect (x*m, 4*x,x/2,n*x); //chimes

    m++;
    n=n-0.2;
  }
  
  d=0;
  n=3;
  for(int i=0;i<10;i++)
  {
    //setGradient(100+d,200,x/2/5*2,n*x,black,white);
    //setGradient(100+x/2/5*3+d,200,x/2/5*2,n*x,white,black);

    n=n-0.2;
    d=d+100;
  }
 

//    stroke(0);
//    if(isRecord)
//    {
//      fill(buttonHighlight);
//      isPlay=false;
//    }
//    else if(!isRecord)
//    {
//      fill(buttonColor);
//    }
    
//    int recordButtonX = width-300;
//    int recordButtonY = height - 150;
//    rect(recordButtonX, recordButtonY, 120, 60, 15); //record button
    
//    if(isPlay)
//    {
//      fill(buttonHighlight);
//      isRecord=false;
//    }
//    else if(!isPlay)
//    {
//      fill(buttonColor);
//    }
    
//    int playButtonX = width - 125;
//    int playButtonY = height - 300;
//    rect(playButtonX, playButtonY, 120, 60, 15); //play button
  
//  fill(255,0,0);
//  ellipse(810, 530, 30, 30);
//  fill(87);
//  //rect(945,515,30,30);
//  fill(87);
//  triangle(1095-100-25,515,1095-100-25,545,1125-100-25,530);
//  //triangle(1095,515,1095,545,1125,530);
//}



//void mousePressed()
//{
//  if(mouseX>RECORDX&&mouseX<RECORDX+120&&mouseY>Y&&mouseY<Y+60)
//  {
//    isRecord=!isRecord;
//    redraw();
//  }
//  else if(mouseX>PLAYX&&mouseX<PLAYX+120&&mouseY>Y&&mouseY<Y+60)
//  {
//    isPlay=!isPlay;
//    redraw();
//  }
//}



//void setGradient(float x, float y, float w, float h, color c1, color c2)
//{ 
  
//  noFill();
//  for (float i=x;i<=x+w;i++)
//  {
//    float inter=map(i,x,x+w,0,1);
//    color c=lerpColor(c1,c2,inter);
//    stroke(c);
//    line(i,y,i,y+h);
//  }
  
}
