public class Camera {
  private PVector pos;
  private float zoom;
  
  Camera(PVector pos){
    this.pos = pos;
    zoom = 1;
  }
  
  public void tick(GameObject obj){
    pos.x = (obj.getPos().x - width/2);//((obj.getPos().x-pos.x) - width/2) * .75;
    pos.y = (obj.getPos().y - height/2);//((obj.getPos().y-pos.y) - height/2) * .75;
  }
  
  public PVector getPos(){ return pos.copy(); }
  public void setPos(PVector pos){ this.pos = pos.copy(); } 
  public float getZoom(){ return zoom; }
  public void setZoom(float zoom){ this.zoom = zoom; }
}
