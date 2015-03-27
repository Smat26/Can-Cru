class Player {

  String name = "Anonymous";

  int score;
  ArrayList state =new ArrayList();
  String[] x = new String[lvl.Stones.size()];
  String[] y = new String[lvl.Stones.size()];
  String[] c = new String[lvl.Stones.size()];
  String[] sz = new String[lvl.Stones.size()];
  String [] list;



  void saveGameState() {
    state = lvl.Stones;
    for (int i= 0; i<state.size (); i++) {
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
    println("SAVED!!");
  }
  void loadGameState() {
    x= loadStrings("/data/text/x.txt"); 
    y= loadStrings("/data/text/y.txt");
    c= loadStrings("/data/text/c.txt");
    sz= loadStrings("/data/text/sz.txt");
    //state = null;
    //
    for (int i=0; i< x.length; i++) {
      if (x[i].equals("")) {
        break;
      }
      state.add(new Stone(Integer.parseInt(x[i]), Integer.parseInt(y[i]), Integer.parseInt(c[i]), Integer.parseInt(sz[i]), state));
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

