class Level implements Display {
  PImage star;
  int startemp;
  ArrayList Stones=new ArrayList();
  int xdimension=14;
  int ydimension=10;
  int NumCols = 0;
  int curX, curY, target;
  int lv=0; 
  int xGap = 1; //margin of the stones from the left
  boolean playFlag, winFlag;
  PImage bg= loadImage("data/Various/bg3.png");
  PImage[][] pic = new PImage[3][5];
  int change = 1; //for cycling through the theme, Change it to affect the starting theme.
  PFont bang = loadFont("data/Various/Bangers-Regular-24.vlw");
  PImage config;
  PImage panel = loadImage("data/Various/panel.png");
  float y = 0; //This for settings rotation
  Boolean wrongclick=false; //to check if click is wrong
  int strike=0; // number of wrong clicks
  int[][] difficult = {
    {
      5, 10, 5, 2
    }
    , 
    {
      7, 10, 4, 2
    }
    , 
    {
      10, 10, 3, 2
    }
    , 
    {
      10, 10, 3, 3
    }
    , 
    {
      12, 10, 2, 3
    }
    , 
    {
      14, 10, 1, 3
    }
    , 
    {
      14, 10, 1, 4
    }
    , 
    {
      14, 10, 1, 5
    }
  };

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
      if (i==2) k = "fishes";
      for (int j =0; j< pic[i].length; j++) {
        pic[i][j] = loadImage("data/"+k+"/"+(j+1)+".png");
        println(i +"  " +j);
      }
    }
    config  = loadImage("configcircle.png");
  }
  void setTheme() {
    change++;
    if (change>2) { //number is the maximum themes - 1 
      change=0;
    }
    for (int i= 0; i<Stones.size (); i++) {
      Stone st = (Stone)Stones.get(i);    
      st.setTheme(change);
    }
  }

  void display() {
   
    image(bg, 0, 0);
    image(panel, 5, 475);
    startemp = abs(5-strike%5);
    if(startemp>5){
    startemp = 5;
    }
    star = loadImage(startemp+".png");
    image(star,400,600);
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
      //line(0, 361, width, 361);
      fill(255);
      textFont(bang, 24);
      text("Score:", 80, 550);
      text(p.score, 170, 550);
      text("Level", 280, 550);
      text(lv+1, 370, 550);

      if (Stones.size()<=0) {
        winFlag=true;
      }
    } else {
      text("Click anywhere to continue", width/2, height/2);
    }
    if (menu.mouseCheck(width-50, 0, width, 100)) {

      //Paste the rotation code here


      image(config, width-50, 0, 50, 50);
    } else {
      y=0;
      image(config, width-50, 0, 50, 50);  // Do not remove this or it will cause a bug
    }
    if (menu.temp == -1 || menu.temp == 3) {
      ui.display();
    }
  }


  void setStone() {
    //code to check which level is it, and then change rows, columns and colours.
    if(lv>=7) lv = 0;
    xdimension= difficult[lv][0];
    ydimension= difficult[lv][1];
    xGap = difficult[lv][2];
    NumCols = difficult[lv][3];


    for (int i =0; i<xdimension; i++) {
      for (int j=0; j< (ydimension); j++) {
        Stones.add(new Stone(i+xGap, j+10-ydimension, (int)random(NumCols), stoneSize));
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
    lv++;
    deleteStone();
    setStone();
    //code for level to increment
  }

  void click() {
    p.saveGameState();
    if (playFlag) {
      if (!winFlag) {
        if (target != -1) {
          Stone st = (Stone)Stones.get(target);
          wrongclick = st.checkSame(target);
        }
        if (!wrongclick) {
         strike ++;
         if(strike>=5){
          lv=0;
          menu.temp = 5;
         
         }
         println("STRIKE!!"+ strike);
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
  }
}

