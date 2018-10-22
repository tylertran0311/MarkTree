class Pair {
  Chime c1;
  Chime c2;
  Chime c3;
  Chime c4;
  Chime c5;
  Boundary b1;
  Boundary b2;
  Boundary b3;
  Boundary b4;
  Boundary b5;
  
  float len;
  Pair(float x, float y) {
    len = 300;
    c1 = new Chime(x,y,50,400,1);
    b1 = new Boundary(width*0.2, 0, 20, 20);
    
    c2 = new Chime(x,y,50,300,2);
    b2 = new Boundary(width*0.3, 0, 20, 20);
    
    c3 = new Chime(x,y,50,200,3);
    b3 = new Boundary(width*0.4, 0, 20, 20);
    
    c4 = new Chime(x,y,50,150,4);
    b4 = new Boundary(width*0.5, 0, 20, 20);
    
    c5 = new Chime(x,y,50,100,5);
    b5 = new Boundary(width*0.6, 0, 20, 20);
   
    DistanceJointDef djd1 = new DistanceJointDef();
    djd1.bodyA = c1.body;
    djd1.bodyB = b1.b;
    
    DistanceJointDef djd2 = new DistanceJointDef();
    djd2.bodyA = c2.body;
    djd2.bodyB = b2.b;
    
    DistanceJointDef djd3 = new DistanceJointDef();
    djd3.bodyA = c3.body;
    djd3.bodyB = b3.b;
    
    DistanceJointDef djd4 = new DistanceJointDef();
    djd4.bodyA = c4.body;
    djd4.bodyB = b4.b;
    
    DistanceJointDef djd5 = new DistanceJointDef();
    djd5.bodyA = c5.body;
    djd5.bodyB = b5.b;
    
    djd1.length = box2d.scalarPixelsToWorld(len);
    djd2.length = box2d.scalarPixelsToWorld(len-50);
    djd3.length = box2d.scalarPixelsToWorld(len-100);
    djd4.length = box2d.scalarPixelsToWorld(len-125);
    djd5.length = box2d.scalarPixelsToWorld(len-150);
    //djd.frequencyHz = 3;
    //djd.dampingRatio = 0.1;
    
    DistanceJoint dj1 = (DistanceJoint) box2d.world.createJoint(djd1);
    DistanceJoint dj2 = (DistanceJoint) box2d.world.createJoint(djd2);
    DistanceJoint dj3 = (DistanceJoint) box2d.world.createJoint(djd3);
    DistanceJoint dj4 = (DistanceJoint) box2d.world.createJoint(djd4);
    DistanceJoint dj5 = (DistanceJoint) box2d.world.createJoint(djd5);
  }
  
  void display() {
  Vec2 pos1 = box2d.getBodyPixelCoord(c1.body);
  Vec2 pos2 = box2d.getBodyPixelCoord(b1.b);
  Vec2 pos3 = box2d.getBodyPixelCoord(c2.body);
  Vec2 pos4 = box2d.getBodyPixelCoord(b2.b);
  Vec2 pos5 = box2d.getBodyPixelCoord(c3.body);
  Vec2 pos6 = box2d.getBodyPixelCoord(b3.b);
  Vec2 pos7 = box2d.getBodyPixelCoord(c4.body);
  Vec2 pos8 = box2d.getBodyPixelCoord(b4.b);
  Vec2 pos9 = box2d.getBodyPixelCoord(c5.body);
  Vec2 pos10 = box2d.getBodyPixelCoord(b5.b);;  
  
  stroke(0);
  
  line(pos1.x,pos1.y - 200,pos2.x,pos2.y);
  line(pos3.x,pos3.y - 150,pos4.x,pos4.y);
  line(pos5.x,pos5.y - 100,pos6.x,pos6.y);
  line(pos7.x,pos7.y - 75,pos8.x,pos8.y);
  line(pos9.x,pos9.y - 50,pos10.x,pos10.y);;
  
  c1.display();
  b1.display();
  b2.display();
  c2.display();
  c3.display();
  b3.display();
  c4.display();
  b4.display();
  c5.display();
  b5.display();
  }
}
