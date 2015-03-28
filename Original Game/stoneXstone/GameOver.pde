class GameOver implements Display{
  PImage ok,bg;
  
  GameOver(){
    t = new TextBox(290,height/2+190,color(255,0,0));
    ok = loadImage("check.png");
    bg = loadImage("gameover.png");
    t.setSize(50);
  }
  
  void display(){
  
  fill(0);
  rect(0,0,width,height);
  image(bg,0,0);
  fill(255);
  //text("Game Over",width/2-100,50);
  image(ok,width/2-30,height/2+250);
  t.show();
  p.name = t.text.toUpperCase();
  println(p.name);
  }


}
