class Stone {
  int c;
  int x, y;
  int sz;
  boolean death;
  int theme;
  Stone(int _x, int _y, int _c, int _sz) {
    x=_x;
    y=_y;
    c=_c;
    sz=_sz;
    death=false;
  }

  void display() {
    printIcon(c);
  } 


  boolean checkSame(int id) {
    boolean same=false;
    for (int i= lvl.Stones.size ()-1; i>=0; i--) {
      Stone oth=(Stone) lvl.Stones.get(i);
      if ((i!=id)&&(!oth.death)) {
        if ((c==oth.c)&&(((abs(x-oth.x)==1)&&(y==oth.y))||((abs(y-oth.y)==1)&&(x==oth.x)))) {
          death=true;   
          oth.death=true;
          same=true;
          p.score+=1;        
          oth.checkSame(i);
        }
      }
    }
    return same;
  }
  



  void printIcon(int c) {

    image(lvl.pic[theme][c], x*sz, y*sz, stoneSize, stoneSize);
  }

  void setTheme(int t) {
    theme= t;
  }
}

