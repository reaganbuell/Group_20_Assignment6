Water w;
Splash s;

ArrayList<Animal> school;
ArrayList<Animal> flock;
Object spikeball;

PImage img;
PImage fishL,fishR;
PImage birdL, birdR;
PImage spike;

void setup(){
  surface.setResizable(true);
  img = loadImage("Sky.png");
  surface.setSize(img.width, img.height);
  
  w = new Water(.11);
  s = new Splash (15, new PVector (-400,100));
  
  fishL = loadImage("fish_headLeft.png");
  fishL.resize(10,10);
  
  fishR = loadImage("fish_headRight.png");
  fishR.resize(10,10);
  
  birdL = loadImage("birdLeft.png");
  birdL.resize(20,20);
  
  birdR = loadImage("birdRight.png");
  birdR.resize(20,20);
  
  school = new ArrayList();
  flock = new ArrayList();
  
  spike = loadImage("spikeball.png");
  spike.resize(40,40);
  spikeball = new Object(spike, -100,mouseY);
  
  for(int i = 0; i < 50; i++){
    school.add(new Fish(fishL,fishR));
    flock.add(new Bird(birdL, birdR));
  }
  
}


void draw(){
  //start wave
  imageMode(CORNER);
  image(img,0,0);
  w.maketriangles();
  w.move();

  //run splash
  s.run();
  
  //run spikeball
  spikeball.display();
  spikeball.update();
  

  //call on flocking behavior for the birds and fish
  for(int i = 0; i < school.size(); i++){
    Animal f = school.get(i);
    f.display();
    f.update(school, spikeball);
  }
  
  for(int i = 0; i < flock.size(); i++){
    Animal b = flock.get(i);
    b.display();
    b.update(flock, spikeball);
  }
  
}

//generate new spike ball and splash at the mouseX position
void mousePressed(){
  spikeball = new Object(spike, mouseX,250);
  s = new Splash(15,new PVector(mouseX+20,300));
  w.splash(int(mouseX+20),200);
  
  
}