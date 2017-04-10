class Bird extends Animal{
  
  float[] border = new float[]{-20,width+20,0,250}; //leftx, rightx, topy, bottomy
  float[] weight = new float[]{20,2.5,0.3}; //aliWeight, sepWeight, cohWeight

  
  Bird(PImage img1,PImage img2){
    super(img1,img2);
    this.pos = new PVector(random(border[0],border[1]),random(border[2],border[3]));
  }
  
  // abstract method 
  void wrap(){
    if(pos.x < border[0]){
      pos = new PVector(border[1],pos.y);
    }
    if(pos.x > border[1]){
      pos = new PVector(border[0],pos.y);
    }
    if(pos.y < border[2]){
      acc.add(0,700);
    }
    if(pos.y > border[3]){
      acc.add(0,-500);
    }
  }
  
  //@ override
  void applyForce(ArrayList<Animal> an){
    PVector ali = align(an);
    PVector sep = seperate(an);
    PVector coh = cohesion(an);
    
    ali.mult(weight[0]); //10
    sep.mult(weight[1]); //0.5
    coh.mult(weight[2]); //0.1
    
    acc.add(ali);
    acc.add(sep);
    acc.add(coh);
    acc.set(acc.x, acc.y/1.3);
  }
  
  // override
  void display(){
    imageMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    if(vel.x < 0 ){
      image(img1, 0, 0);
    }
    else{
      image(img2, 0, 0);
    }
    popMatrix();
  }
  
  
  void avoid(Object obj){
    if(PVector.dist(obj.pos,pos) < 100){
      acc.set(PVector.sub(pos,obj.pos).mult(10000));
      vel.add(acc);
    }
  }

  
}