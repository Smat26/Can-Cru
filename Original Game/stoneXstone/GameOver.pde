class GameOver implements Display{

  
  GameOver(){
    t = new TextBox(100,height/2,color(255,0,0));
    t.setSize(50);
  }
  
  void display(){
  fill(0);
  rect(0,0,width,height);
  fill(255);
  text("Game Over",width/2-100,50);
  t.show();
  p.name = t.text.toUpperCase();
  println(p.name);
  }


}
