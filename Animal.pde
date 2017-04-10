abstract class Animal{
  PVector pos,vel,acc;
  float maxSpeed = 6;
  PImage img1,img2;
    
  float[] border; //leftx, rightx, topy, bottomy
  float[] weight; //aliWeight, sepWeight, cohWeight
  
  
  Animal(PImage img1, PImage img2){
    this.pos = new PVector(random(width),random(height));
    this.vel = new PVector(random(-0.5,0.5),random(-0.5,0.5));
    this.acc = new PVector(0,0);
    this.img1 = img1.copy();
    this.img2 = img2.copy();
  }
  
  abstract void wrap();
  abstract void display();
  abstract void avoid(Object obj);
  abstract void applyForce(ArrayList<Animal> an);
  
  void update(ArrayList<Animal> an, Object obj){
    wrap();
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0); 
    applyForce(an);
    avoid(obj);
  }
  
  
  PVector align(ArrayList<Animal> an){
    PVector steer = new PVector();
    int cnt = 0;
    for(int i = 0; i < an.size(); i++){
      Animal ind = an.get(i);
      // find neighbor
      if(PVector.dist(pos,ind.pos) < 100){
        // add their velocity together
        steer.add(ind.vel); 
        cnt ++;
      }
    }
    // avg velocity / heading
    steer.div(cnt);
    return steer;
  }
  
  PVector seperate(ArrayList<Animal> an){
    PVector steer = new PVector();
    int cnt = 0;
    for(int i = 0; i < an.size(); i++){
      Animal ind = an.get(i);
      // if they get too close with each other, repulsion force
      float dis = PVector.dist(pos,ind.pos);
      if(dis < 30){
        steer.add(PVector.sub(pos,ind.pos));
        cnt ++;
      }
      if(dis < 10){
        steer.add(PVector.sub(pos,ind.pos).mult(30));
      }
    }
    steer.div(cnt);
    return steer;
  }
  
  PVector cohesion(ArrayList<Animal> an){
    PVector steer;
    float xpos = 0, ypos = 0;
    PVector avgLoc;
    int cnt = 0;
    for(int i = 0; i < an.size(); i++){
      Animal ind = an.get(i);
      // find neighbor
      if(PVector.dist(pos,ind.pos) < 100){
        // find total position
        xpos += ind.pos.x;
        ypos += ind.pos.y;
        cnt ++;
      }
    }
    avgLoc = new PVector(xpos/cnt,ypos/cnt);
    steer = PVector.sub(avgLoc,pos);
    return steer;
  }
  
  

}