class Stone {
  int c;
  int x, y;
  int sz;
  ArrayList other;
  boolean death;
<<<<<<< HEAD
  Stone(int _x, int _y,int _c, int _sz, ArrayList _other){
=======
  int dieCount=0;
  Stone(int _x, int _y, color _c) {
    x=_x;
    y=_y;
    c=_c;
    sz=10;
  }
  Stone(int _x, int _y, int _c, int _sz, ArrayList _other) {
>>>>>>> origin/master
    x=_x;
    y=_y;
    c=_c;
    sz=_sz;
    other=_other;
    death=false;
<<<<<<< HEAD
 }
  
void display(){
  
  
  fill(color(cols[c]));
  //translate(x*sz, y*sz);

  ellipse(x*sz,y*sz,sz,sz);


  image(eye,x*sz,y*sz,stoneSize,stoneSize);
  
  
  
} 
=======
  }

  void display(int curX, int curY) {


    fill(color(cols[c]));
    translate(x*sz, y*sz);
    
    
    

    ellipse(0,0,sz,sz);
//    if (c==1) {
//      image(sw1, 0, 0, szSto, szSto);
//    }
//    if (c==2) {
//      image(sw2, 0, 0, szSto, szSto);
//    }
//    if (c==0) {
//      image(sw3, 0, 0, szSto, szSto);
//    }

    /*if(death){
     image(eyeD,0,0,szSto,szSto);      
     }
     else if (((int)random(1000))==1){
     image(eyeC,0,0,szSto,szSto);
     }
     else if((x==curX)&&(y>curY)){
     image(eyeT,0,0,szSto,szSto);
     }
     else if((x==curX)&&(y<curY)){
     image(eyeB,0,0,szSto,szSto);
     }
     else if((y==curY)&&(x>curX)){
     image(eyeL,0,0,szSto,szSto);    
     }
     else if((y==curY)&&(x<curX)){
     image(eyeR,0,0,szSto,szSto);    
     }
     else if((y<curY)&&(x<curX)){
     image(eyeRB,0,0,szSto,szSto);        
     }
     else if((y<curY)&&(x>curX)){
     image(eyeLB,0,0,szSto,szSto);            
     }
     else if((y>curY)&&(x<curX)){
     image(eyeRT,0,0,szSto,szSto);            
     }
     else if((y>curY)&&(x>curX)){
     image(eyeLT,0,0,szSto,szSto);            
     }
     else{
     image(eye,0,0,szSto,szSto);
     }*/

>>>>>>> origin/master

    translate(-x*sz, -y*sz);
  } 


<<<<<<< HEAD
boolean checkSame(int id){
  boolean same=false;
  for(int i= other.size()-1;i>=0;i--){
          Stone oth=(Stone) other.get(i);
    if((i!=id)&&(!oth.death)){
      if((c==oth.c)&&(((abs(x-oth.x)==1)&&(y==oth.y))||((abs(y-oth.y)==1)&&(x==oth.x)))){
        death=true;   
        oth.death=true;
        same=true;
          score+=1;        
              
        oth.checkSame(i);
=======

  boolean checkSame(int id) {
    boolean same=false;
    for (int i= other.size ()-1; i>=0; i--) {
      Stone oth=(Stone) other.get(i);
      if ((i!=id)&&(!oth.death)) {
        if ((c==oth.c)&&(((abs(x-oth.x)==1)&&(y==oth.y))||((abs(y-oth.y)==1)&&(x==oth.x)))) {
          death=true;   
          oth.death=true;
          same=true;
          mark+=NumCols-2;        
          tMark+=mark;

          oth.checkSame(i);
        }
>>>>>>> origin/master
      }
    }
    return same;
  }
}

