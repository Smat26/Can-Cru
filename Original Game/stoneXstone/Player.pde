class Player {

  String name = "Anonymous";

  int score;
  ArrayList state =new ArrayList();
  String[] x = new String[140];
  String[] y = new String[140];
  String[] c = new String[140];
  String[] sz = new String[140];
  String [] list;
  String[] a= new String[2];
  int size;



  void saveGameState() {
    state = lvl.Stones;
    
    

    for (int i= 0; i<state.size(); i++) {
      Stone st = (Stone)state.get(i);
      x[i] =Integer.toString(st.x);
      y[i]= Integer.toString(st.y);
      c[i]= Integer.toString(st.c);
      sz[i]=Integer.toString(st.sz);
    }
    
    saveStrings("/data/text/x.txt", x);
    saveStrings("/data/text/y.txt", y);
    saveStrings("/data/text/c.txt", c);
    saveStrings("/data/text/sz.txt", sz);
    String[] a ={Integer.toString(score), Integer.toString(lvl.lv)};
    saveStrings("/data/text/score.txt",a);
    println("SAVED!!");
    
   
   
   //making values null
        for (int i= 0; i<state.size (); i++) {
      x[i] =null;
      y[i]= null;
      c[i]= null;
      sz[i]= null;
      
    }
    state = null;
  }
  void loadGameState() {
    x= loadStrings("/data/text/x.txt"); 
    y= loadStrings("/data/text/y.txt");
    c= loadStrings("/data/text/c.txt");
    sz= loadStrings("/data/text/sz.txt");
    a = loadStrings("/data/text/score.txt");
    score = Integer.parseInt(a[0]);
    lvl.lv = Integer.parseInt(a[1]);
    //state = null;
    //
    for (int i=0; i< x.length; i++) {
      if (x[i].equals("null")) {
        
        break;
      }
      println(i);
      state.add(new Stone(Integer.parseInt(x[i]), Integer.parseInt(y[i]), Integer.parseInt(c[i]), Integer.parseInt(sz[i])));
    }
    lvl.Stones = state;
    println("LOADED!!");
  }


  //    void saveGame(){
  //    loadGame();  //Dont remove this otherwise it will cause some bugs
  //    if(searchName()){
  //    load[x] = name;
  //    load[x+1] = Integer.toString(score);
  //    saveStrings("leaderboard.txt", load);
  //    }else{
  //    list = new String[load.length+2];
  //    for(int i=0;i<load.length;i++){
  //    list[i] = load[i];
  //    }
  //    list[load.length] = name;
  //    list[load.length+1] = Integer.toString(score);
  //    saveStrings("leaderboard.txt", list);
  //    }  
  //  }
  //    
  //        
  //    boolean searchName(){
  //    loadGame();
  //    for(int i=0;i<load.length;i++){
  //    if(load[i].trim().equals(name)){
  //    println("Found one");
  //    x = i;
  //    p.name = load[i].trim();
  //    p.score = Integer.parseInt(load[i+1].trim());
  //    println("Load Score: " + load[i+1]);
  //    return true;
  //    }
  //    }
  //    println("Not found");
  //    return false;    
  //    }
  //    
  //    void loadGame(){
  //    load = loadStrings("leaderboard.txt");
  //    }
}

