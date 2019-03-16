void resetCheck(){
  if(reset){
    handler = new Handler();
    score = 0;
    
    //fix level screen in final game
    if(level <= 0){
      level++;
    }
    
    if(level == 1){
      par = 1;
      
      float[] xList = {width/2,width/2,width};
      float[] yList = {height/4,height,height/2};
      float[] mList = {200,100,250};
      
      levelDecomp(xList,yList,mList);
      
      handler.addObj(new Body(width*2, height/2,500,Tag.GOAL));
      handler.addObj(new Rocket(width/2,height/2));
      
    }
    
    else if(level == 2){
      par = 1;
      
      float[] xList = {width/2,width*2.5};
      float[] yList = {height/2, height/2};
      float[] mList = {100, 1000};
      
      levelDecomp(xList,yList,mList);
      
      handler.addObj(new Body(width*5, height/2,100,Tag.GOAL));
      handler.addObj(new Rocket(width/2,height/2+20));
      
    }
    
    else if(level == 3){
      par = 2;
      
      float[] xList = {width*.5,width*.5,width*1.5  ,width*2   ,width*3.5, width*4,width*5.5 , width*2  ,width*2};
      float[] yList = {height*.25,height*1,height*1 ,height*.75,height*.5,height*2,height*1,height*.25,height*-.75};
      float[] mList = {101,100,100,175,200,550,200,150,400};
      
      levelDecomp(xList,yList,mList);
      
      handler.addObj(new Body(width*5.25, height*5/8,25,Tag.GOAL));
      handler.addObj(new Rocket(width/2,height/2));
      
    }
    
    else if(level == 4){
      
    }
    
    else if(level == 5){
      
    }
    
    reset = false;
    gameMode = GameMode.FLIGHT;
  }
}

void levelDecomp(float[] xList, float[] yList, float[] mList){
  for(int i = 0; i <= yList.length - 1; i++){
    handler.addObj(new Body(xList[i],yList[i],mList[i],Tag.BODY));
  }
}
