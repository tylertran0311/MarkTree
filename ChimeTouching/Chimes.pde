class Chime {
   float x;
   float y;
   float w;
   float h;
   int id; 
  Body body;
  
  Chime(float x_, float y_,float w_,float h_,int id_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    id = id_;
     
    //body.setUserData(this);
    
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position = box2d.coordPixelsToWorld(x,y);
    body = box2d.world.createBody(bd);
    body.setUserData(this);
    
    PolygonShape sd = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    sd.setAsBox(box2dW,box2dH);
    
    // Define a fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = sd;
    
    // Parameters that affect physic
    
    body.createFixture(fd);

  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
  
  void display() {
    Vec2 pos = box2d.getBodyPixelCoord(body);
    pushMatrix();
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(pos.x,pos.y,w,h);
    popMatrix();
  }
  
  int getID(){
    return id;
  }
}
