class GameOver implements Display{
  PImage ok;
  
  GameOver(){
    t = new TextBox(100,height/2,color(255,0,0));
    ok = loadImage("check.png");
    t.setSize(50);
  }
  
  void display(){
  
  fill(0);
  rect(0,0,width,height);
  fill(255);
  text("Game Over",width/2-100,50);
  image(ok,width/2,height/2+250);
  t.show();
  p.name = t.text.toUpperCase();
  println(p.name);
  }


}
