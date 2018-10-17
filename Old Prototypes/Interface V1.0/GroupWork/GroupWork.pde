PImage img;
PImage woodImg;
final float x=100;
final int W=1150;
final int H=600;
final int BARW=950;
final int BARH=50;
final int RECORDX=750;
final int Y=500;
final int PLAYX=750+150;


boolean isRecord=false;
boolean isPlay=false;

color white,black, buttonColor,buttonHighlight;

void setup()
{
  size (1150,600);
  //background(0,255,255);
  img=loadImage("1.jpg");
  woodImg = loadImage("wood1.jpg");
  setupImg();
  
  white=color(255);
  black=color(120);
  buttonColor=color(211);
  buttonHighlight=color(100);
}

void draw()
{
  noLoop();

  
  float m=1;
  float n=3;
  float d=0;

  //fill(150, 111, 51);
  //rect (x, x/2,9.5*x,x/2);
  image(woodImg,100,50,BARW,BARH);
  
  
  for(int i=0;i<10;i++)
  {
    stroke(0);
    line (125+d,x,125+d,2*x);
    d=d+100;
    
    fill(255);
    noStroke();
    rect (x*m, 2*x,x/2,n*x);

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
 

    stroke(0);
    if(isRecord)
    {
      fill(buttonHighlight);
      isPlay=false;
    }
    else if(!isRecord)
    {
      fill(buttonColor);
    }
    rect(750, 500, 120, 60, 15); //record button
    
    if(isPlay)
    {
      fill(buttonHighlight);
      isRecord=false;
    }
    else if(!isPlay)
    {
      fill(buttonColor);
    }
    rect(750+175, 500, 120, 60, 15); //play button
  
  fill(255,0,0);
  ellipse(810, 530, 30, 30);
  fill(87);
  //rect(945,515,30,30);
  fill(87);
  triangle(1095-100-25,515,1095-100-25,545,1125-100-25,530);
  //triangle(1095,515,1095,545,1125,530);
}

void keyPressed()
{
  if(key=='1')
  {
    img=loadImage("1.jpg");
     setupImg();
  }
  else if(key=='2')
  {
     img=loadImage("2.jpg");
     setupImg();
  }
  
  else if(key=='3')
  {
     img=loadImage("3.jpg");
     setupImg();
  }
  
  else if(key=='4')
  {
     img=loadImage("4.jpg");
     setupImg();
  }
  
  else if(key=='5')
  {
     img=loadImage("5.jpg");
     setupImg();
  }
  
  else if(key=='6')
  {
     img=loadImage("6.jpg");
     setupImg();
  }
  
  else if(key=='7')
  {
     img=loadImage("7.jpg");
     setupImg();
  }
  
  else if(key=='8')
  {
     img=loadImage("8.jpg");
     setupImg();
  }
  else if(key=='9')
  {
     img=loadImage("9.png");
     setupImg();
  }
  else if(key=='0')
  {
     img=loadImage("0.jpg");
     setupImg();
  }
  
  else if(key=='q'||key=='Q')
  {
    woodImg=loadImage("wood1.jpg");
    redraw();
  }
    else if(key=='w'||key=='W')
  {
    woodImg=loadImage("wood2.jpg");
    redraw();
  }
    else if(key=='e'||key=='E')
  {
    woodImg=loadImage("wood3.jpg");
    redraw();
  }
    else if(key=='r'||key=='R')
  {
    woodImg=loadImage("wood4.jpg");
    redraw();
  }
}

void mousePressed()
{
  if(mouseX>RECORDX&&mouseX<RECORDX+120&&mouseY>Y&&mouseY<Y+60)
  {
    isRecord=!isRecord;
    redraw();
  }
  else if(mouseX>PLAYX&&mouseX<PLAYX+120&&mouseY>Y&&mouseY<Y+60)
  {
    isPlay=!isPlay;
    redraw();
  }
}

void setupImg()
{
  img.resize(W,H);
  background(img);
  redraw();
}

void setGradient(float x, float y, float w, float h, color c1, color c2)
{ 
  
  noFill();
  for (float i=x;i<=x+w;i++)
  {
    float inter=map(i,x,x+w,0,1);
    color c=lerpColor(c1,c2,inter);
    stroke(c);
    line(i,y,i,y+h);
  }
  
}
