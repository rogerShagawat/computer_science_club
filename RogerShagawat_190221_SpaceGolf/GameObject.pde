abstract class GameObject{
  protected PVector pos = new PVector();
  protected PVector vel = new PVector();
  protected PVector acc = new PVector();
  protected float m;
  protected Tag tag;
  
  GameObject(float x, float y){
    pos.x = x;
    pos.y = y;
  }
  
  void applyForce(PVector force){
    PVector f = PVector.div(force,m);
    acc.add(f);
  }
  
  abstract void tick();
  abstract void render();
  
  void setPos(PVector pos){ this.pos = pos; }
  void setVel(PVector vel){ this.vel = vel; }
  void setAcc(PVector acc){ this.pos = acc; }
  void setM(float m){ this.m = m; }
  void setTag(Tag tag){ this.tag = tag; }
  
  PVector getPos(){ return pos.copy(); }
  PVector getVel(){ return vel.copy(); }
  PVector getAcc(){ return acc.copy(); }
  float getM(){ return m; } 
  Tag getTag(){ return tag; }
}
