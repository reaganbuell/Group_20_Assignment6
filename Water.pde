class Water{
 ArrayList <Drops> drops;
 int numdrops;
 
 //constructor
 Water(float dropsize){
   numdrops = int(width/dropsize);
   drops = new ArrayList();
   for (int i = 0; i < numdrops; i ++){
     drops.add(new Drops(300, dropsize));
   } 
 }
 
 void move(){
   for (int i =0; i< drops.size(); i++){
     drops.get(i).update();
   }
   float[] leftNext = new float[drops.size()];
   float[] rightNext = new float[drops.size()];
   
   //pull on neighbors
   for (int j=0; j<30; j++){
     for (int i =0; i < drops.size(); i++){
       if (i>0){
         leftNext[i] = 0.25 * (drops.get(i).loc() - drops.get(i-1).loc());
         drops.get(i-1).setspeed(leftNext[i]*5);
       }
       if ( i < drops.size() -1){
         rightNext[i] = 0.25 * (drops.get(i).loc() - drops.get(i+1).loc());
         drops.get(i+1).setspeed(rightNext[i]*5);
       }
     }
     for (int i =0; i < drops.size(); i++){
       if (i>0){
         drops.get(i-1).shift(leftNext[i], i);
       }
       if (i < drops.size() -1){
         drops.get(i+1).shift(rightNext[i], i);
       }
     }
   }
 }
 
 PShape tri1, tri2;
 void maketriangles(){
   //float scale = width/(drops.size()-1);
   float bottom = height;
   for (int i = 1; i < width; i++){
     tri1 = createShape();
     tri1.setStroke(#00749D);//#00749D
     tri1.setFill(color(#89ECFF)); //teal 
     tri1.beginShape(TRIANGLES); //#4BD9FF
     tri1.vertex((i-1), drops.get(i-1).loc());
     tri1.vertex(i, drops.get(i).loc());
     tri1.vertex(i, bottom); 
     tri1.endShape();
     shape(tri1);
     
     //tri2 = createShape();
     //tri2.setFill(color(255)); 
     //tri2.beginShape(TRIANGLES);
     //tri2.vertex((i-1), drops.get(i-1).loc());
     //tri2.vertex(i, bottom);
     //tri2.vertex((i-1), bottom);
     //tri2.endShape();
     //shape(tri2);
   }
 }
 void splash(int xpos, float force){
   if (xpos >= 0 && xpos < drops.size()){
     drops.get(xpos).setspeed(force);
   }
 }
}