class Object{
  PVector pos,vel,acc;
  boolean out;
  PImage img;
  
  Object(PImage img, float x,float y){
    this.pos = new PVector(x,y);
    this.vel = new PVector(0,0.5);
    this.acc = new PVector(0,2);
    this.out = false;
    this.img = img;
  }
  
  void update(){
    pos.add(vel);
    vel.add(acc);
    if(pos.y > height){
      out = true;
    }
  }
  float getHeight(){
    return pos.y;
  }
  void display(){
    if(!out){
      image(img, pos.x, pos.y);
      //ellipse(pos.x,pos.y,20,20);
    }
  }
}