class Particle{
  PVector pos;
  PVector vel;
  float life;
  
  Particle(PVector _pos){
    pos = _pos.copy();
    vel = new PVector(random(-5,5), random(0,10)).add(0,-15);
    //orient = _orient;
    life = 20;
  }
  void update(){
    vel.add(0,1);
    pos.add(vel);
    life -= 1.0;
  }
  
  void display(){
    stroke(#4BD9FF);
    fill(#4BD9FF,life+100);
    ellipse(pos.x,pos.y,10,10);
  }
 
  boolean isOff(){
    if (life < 0.0) {
      return true;
    }else{
      return false;
    }
  }
  
  void run(){
    update();
    display();
  }
}