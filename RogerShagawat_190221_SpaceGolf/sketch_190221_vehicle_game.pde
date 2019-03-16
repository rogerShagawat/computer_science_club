
import java.util.LinkedList;

boolean reset = false;
boolean clicked = false;
long t;
float frmRt;
int level;
int score;
int par;

Camera camera;
Handler handler;
GameMode gameMode;
void setup(){
  background(0);
  size(750,750);
  frameRate(60);
  
  frmRt = 60;
  t = 0;
  score = 0;
  
  camera = new Camera(new PVector(0,0));
  level = -1; //fix menu screen in final game
  reset = true;
  resetCheck();
}

void tick(){
  handler.tick();
  
  for(GameObject obj : handler.list){
    if(obj.getTag() == Tag.ROCKET){
      camera.tick(obj);
    }
  }
}

void render(){
  background(0);
  
  
  pushMatrix();
    translate(-camera.getPos().x,-camera.getPos().y);
    
    handler.render();
    
    //display par
    fill(255,255,0);
    textSize(32);
    text("Par: "+par,width/8,height/8);
    
    translate(camera.getPos().x,camera.getPos().y);
  popMatrix();
 
 //minimap
  pushMatrix();
    scale(.1 * camera.getZoom());
    handler.render();
  popMatrix();
  
  //display score
  fill(255,255,0);
  textSize(28);
  text("Shots: " + score, width*6/8, height*15/16);
  
  //framerate
  if(t%10==0)
    frmRt = frameRate;
  textSize(24);
  fill(255,255,0);
  text(frmRt,(50*width)/64,height/16);
  
  //menu (fix in final game)
  if(level <= 0){
    textAlign(CENTER);
    textSize(32);
    fill(255);
    text("press R to restart\nand click for everything else\nyou should click R right now\nalso u look kinda cute",width/2,height/4);
  }
  
  if(level > 3){
    textAlign(CENTER);
    textSize(32);
    fill(255);
    text("you just freaking won the game cutie",width/2,height/4);
  }
}

void draw(){
  t++;
  if(clickCoolDown>=0)
    clickCoolDown--;
  tick();
  render();
  resetCheck();
  
  
}
enum GameMode{
  FLIGHT,LANDED,LAUNCH,WIN;
}
enum Tag{
  BODY,ROCKET,GOAL;
}
