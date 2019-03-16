boolean click;
float clickCoolDown;

void keyPressed(){
  setMove(keyCode, true);
}

void keyReleased(){
  setMove(keyCode, false);
}

boolean setMove(int k, boolean b){
  switch(k){
    case 'R':
      return reset = b;
    default:
      return b;
  }
}

void mouseWheel(MouseEvent event){
  float e = event.getCount();
  setZoom(e);
}

void setZoom(float e){
  if(e<0)
  camera.setZoom(camera.getZoom()+.1*camera.getZoom());
  
  if(e>0)
  camera.setZoom(camera.getZoom()-.1*camera.getZoom());
}

void mousePressed(){
  if(clickCoolDown <=0){
    clickCoolDown = 15;
    mouseClick(true);
  }
}

void mouseReleased(){
  mouseClick(false);
}

boolean mouseClick(boolean b){
  return click = b;
}
