class LevelUI implements Display{
  int i = -200;
  int speed = 2;
  void display(){
   
  fill(0);
  if(menu.temp == 3 && i>-200){
  i-=speed;
  }
  rect(i,0,200,height);
  if(menu.temp == -1 && i<0){
  i+=speed;
  }
  
  }




}
