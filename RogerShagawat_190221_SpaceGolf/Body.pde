class Body extends GameObject{
  private float r;
  Body(float x, float y, float m, Tag tag){
    super(x,y);
    this.m = m;
    this.r = m;
    this.tag = tag;
  }
  
  void tick(){
    
    //everything while in flight
    if(gameMode == GameMode.FLIGHT){
      for(GameObject obj : handler.list){
        if(obj.getTag() == Tag.ROCKET){
          
          //applies force to rocket
          PVector grav = obj.getPos().sub(pos);
          grav.normalize().mult(-1).mult((50*m*obj.getM())/((float)Math.pow(obj.pos.dist(pos),1.75)));
          obj.applyForce(grav);
          
          //changes gamemode to landed if the rocket is in radius
          if(r/2 >= PVector.sub(pos,obj.pos).mag()){
            if(tag == Tag.BODY){
              gameMode = GameMode.LANDED;
              score++;
            }
            else if(tag == Tag.GOAL){
              gameMode = GameMode.WIN;
              level++;
            }
          }
        }
      }
    }
  }
  
  void render(){
    noStroke();
    ellipseMode(CENTER);
    if(tag == Tag.BODY)
      fill(255);
    else if(tag == Tag.GOAL)
      fill(0,255,0);
    ellipse(pos.x,pos.y,r,r);
    
    
    
  }
}
