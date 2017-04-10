class Drops{
  float pos;
  float size;
  float vel;
  float x;
  
  Drops(float pos, float size){
    this.pos = pos;
    this.size = size;
  }
    
    void update(){
      float k = 1;
      float dist = pos - 300;
      float accel = -k*dist;
      
      pos = constrain(pos,250,350);
      
      pos += vel;
      vel += accel;
    }
    
    
    
    float loc(){
     return pos;
    }
    void addspeed(float speed){
     vel += speed;
     
    }
    void setspeed(float speed){
      vel = speed;
    }
    void shift(float distance, float xpos){
     pos += distance;
     x = xpos;
    }
    void display(){
     ellipse(x, pos, size,size);
     stroke(#89ECFF); 
     fill(#89ECFF);
    }
} 