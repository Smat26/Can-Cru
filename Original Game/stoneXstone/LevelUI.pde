class LevelUI implements Display {
  int i = -200;
  int speed = 2;
  PImage sound = loadImage("sound.png");
  PImage nosound = loadImage("nosound.png");
  void display() {
    
    fill(0);
    pushMatrix();
    translate(i,0);
    rect(0, 0, 200, height);
    fill(255);
    text("Menu",75,50);
    if(menu.mouseCheck(75, 250, 200, 270)){fill(255,0,0);}
    text("Restart",75,250);
    text("Back",75,290);
    text("Exit",75,330);
    if(menu.audio == 1)
    image(sound,100,height - 100);
    else
    image(nosound,100,height - 100);
    popMatrix();  
    if (menu.temp == 3 && i>-200) {
      i-=speed;
    }
    if (menu.temp == -1 && i<0) {
      i+=speed;
    }
   

}
}

