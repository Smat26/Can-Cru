class Exit implements Display{

  PImage ext,ext_y,ext_n;
  
  Exit(){
  
    ext = loadImage("extbox.png");
    ext_y = loadImage("extbox_y.png");
    ext_n= loadImage("extbox_n.png");
  
  }
  void display(){
  fill(0,0,0,85);
  rect(0,0,width,height);
  imageMode(CENTER);
  
  
  if(menu.mouseCheck(240, 360, 330, 450)){
    println("yes");
    image(ext_y, width/2, height/2);  
  }
  else if(menu.mouseCheck(470, 360, 560, 450)){
  image(ext_n, width/2, height/2);
  }
  else{
  image(ext, width/2, height/2);  
  }
  imageMode(CORNER);
  }
  

}
