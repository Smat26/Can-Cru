class Level implements Display {
  ArrayList Stones=new ArrayList();
  int xdimension=10;
  int ydimension=12;
  int NumCols = 5;
  int curX, curY, target;
  int lv=0; 
  int xGap = 4; //margin of the stones from the left
  boolean playFlag, winFlag;
  PImage bg= loadImage("data/Various/bg3.png");
  PImage[][] pic = new PImage[3][5];
  int change = 1; //for cycling through the theme, Change it to affect the starting theme.
  PImage config;
  float y = 0; //This for settings rotation
  Level() {

    imageMode(CORNER);
    ellipseMode(CORNER);
    setStone();
    playFlag=false;
    winFlag=false;
  }
  void loadImages() {
    String k=""; //holds folder name to path
    //the loops fills the 2d array with images
    for (int i = 0; i < pic.length; i++) {
      if (i == 0) k = "birds";
      if (i == 1) k = "animals vec";
      if(i==2) k = "fishes";
      for (int j =0; j< pic[i].length; j++) {
        pic[i][j] = loadImage("data/"+k+"/"+(j+1)+".png");
        println(i +"  " +j);
      }
    }
    config  = loadImage("config.png");
  }
  void setTheme() {
    change++;
    if (change>2){ //number is the maximum themes - 1 
      change=0;
    }
    for (int i= 0; i<Stones.size (); i++) {
      Stone st = (Stone)Stones.get(i);    
      st.setTheme(change);
    }
  }

  void display() {
     
    background(0);
    image(bg,0,0);
    noStroke();
    if (playFlag) {    
      curX=((int)(mouseX/stoneSize));
      curY=((int)(mouseY/stoneSize));
      target=-1;
      boolean shift=false;
      for (int i= 0; i<Stones.size (); i++) {
        Stone st = (Stone)Stones.get(i);    
        if (st.death) {

          Stones.remove(i); 
          i--;
        } else {      
          if (i!=Stones.size()-1) {
            Stone next= (Stone)Stones.get(i+1);
            if (!shift) {        
              if (((next.y-st.y)>1)||((next.x-st.x!=0)&&(st.y!=ydimension-1))) {
                st.y+=1;
              }
              if ((next.x-st.x)>1) {
                shift=true;
              }
            } else {
              st.x-=1;
            }
          } else { 
            if (st.y!=ydimension-1) {
              st.y+=1;
            }
            if (shift) {
              st.x-=1;
            }
          }
          if ((curX==st.x)&&(curY==st.y)) {
            target=i;
          }    
          st.display();
        }
      }  
      fill(255);
      noFill();
      stroke(255);
      strokeWeight(3);  
      rect(curX*stoneSize, curY*stoneSize, stoneSize, stoneSize);
      line(0, 361, width, 361);
      fill(200);
      text("Score:", 50, 400);
      text(p.score, 140, 400);
      text("Level", 250, 400);
      text(lv, 340, 400);

      if (Stones.size()<=0) {
        winFlag=true;
      }
    } else {
      text("Click anywhere to continue", width/2, height/2);
    }
    if(menu.mouseCheck(width-50, 0, width, 100)){

      //Paste the rotation code here
      
      image(config,width-50,0,50,50);
      
          }else{
      y=0;
    image(config,width-50,0,50,50);  // Do not remove this or it will cause a bug
    }
    if(menu.temp == -1 || menu.temp == 3){
    ui.display();
    }
  }


  void setStone() {
    //code to check which level is it, and then change rows, columns and colours.
    for (int i =0; i<xdimension; i++) {
      for (int j=0; j< (ydimension); j++) {
        Stones.add(new Stone(i+xGap, j+10-ydimension, (int)random(NumCols), stoneSize, Stones));
      }
    }
  }

  void deleteStone() {
    for (int i= 0; i<Stones.size (); i++) {
      Stones.remove(i);  
      i--;
    }
  }

  void replay() {
    deleteStone();
    setStone();
    //code for level to increment
  }

  void click() {
    
    if (playFlag) {
      if (!winFlag) {
        if (target != -1) {
          Stone st = (Stone)Stones.get(target);
          st.checkSame(target);
        }
      } else {
        if (lv<5) {
          lv++;
        }
        winFlag=false;
        replay();
      }
    } else {
      playFlag=true;
    }
    //code to check if one stone remain.
  }
}

