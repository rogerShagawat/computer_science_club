class Rocket extends GameObject{
  Rocket(float x, float y){
    super(x,y);
    this.m = 10;
    tag = Tag.ROCKET;
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }
  
  void tick(){
    
    if(click){
        if(gameMode == GameMode.LANDED)
            gameMode = GameMode.LAUNCH;
        else if(gameMode == GameMode.LAUNCH)
            gameMode = GameMode.FLIGHT;
      click = false;
    }
    
    //Any Actions that occur while in the air
    if(gameMode == GameMode.FLIGHT){
      pos = pos.add(vel);
      vel = vel.add(acc);
      acc.mult(0);
      
    }
    
    //Actions that occur when Landed
    if(gameMode == GameMode.LANDED){
      vel.mult(0);
      acc.mult(0);
      for(GameObject obj : handler.list){
        if(obj.tag == Tag.BODY && (obj.m*1.5)/2 >= PVector.sub(obj.pos,pos).mag()){
          pos = obj.pos.copy();
          pos.add(PVector.sub(new PVector(obj.getPos().x - camera.getPos().x,obj.getPos().y - camera.getPos().y), new PVector(mouseX,mouseY)).normalize().mult(-obj.m/1.99));
        }
      }
    }
    
    //actions that occur when ready to launch
    if(gameMode == GameMode.LAUNCH){
      //changes velocity to displacement between mouse and rokcet
      vel = PVector.sub(PVector.add(pos,camera.pos), PVector.add(new PVector(mouseX+camera.getPos().x,mouseY+camera.getPos().y), camera.pos)).mult(-0.1);
    }
  }
  
  void render(){
    if(gameMode != GameMode.WIN){
      fill(0,127,255);
      rectMode(CENTER);
      noStroke();
      rect(pos.x,pos.y,m,m);
      
      //velocity vector
      pushMatrix();
      translate(pos.x,pos.y);
      stroke(255,255,0);
      strokeWeight(2);
      line(0,0,vel.x*5,vel.y*5);
      popMatrix();
    }
    if(gameMode == GameMode.LAUNCH){
      stroke(255,255,0);
      strokeWeight(3);
      line(pos.x, pos.y, mouseX+camera.getPos().x, mouseY+camera.getPos().y);
    } 
    if (gameMode == GameMode.WIN){
      
      //win sentence (move to text class in final game)
      fill(255);
      rectMode(CENTER);
      rect(camera.getPos().x + width/2, camera.getPos().y + height/2,300,100);
      fill(0);
      textSize(32);
      textAlign(CENTER);
      text("you win!\nand are beautiful", camera.getPos().x + width/2, camera.getPos().y + height/2 - 10);
    }
  }
}
