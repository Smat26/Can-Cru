class Exit implements Display{

  PImage ext,ext_y,ext_n;
  
  Exit(){
  
    ext = loadImage("extbox.png");
    ext_y = loadImage("extbox_y.png");
    ext_n= loadImage("extbox_n.png");
  
  }
  void display(){
  fill(0,0,0,10);
  rect(0,0,width,height);
  imageMode(CENTER);
  image(ext, width/2, height/2);  
  imageMode(CORNER);
  }
  

}
