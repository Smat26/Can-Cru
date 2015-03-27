class Player{

    String name = "Anonymous";
    int score;
    String []load;
    String [] list;
    int x;
    
    void saveGame(){
    loadGame();  //Dont remove this otherwise it will cause some bugs
    if(searchName()){
    load[x] = name;
    load[x+1] = Integer.toString(score);
    saveStrings("leaderboard.txt", load);
    }else{
    list = new String[load.length+2];
    for(int i=0;i<load.length;i++){
    list[i] = load[i];
    }
    list[load.length] = name;
    list[load.length+1] = Integer.toString(score);
    saveStrings("leaderboard.txt", list);
    }  
  }
    
        
    boolean searchName(){
    loadGame();
    for(int i=0;i<load.length;i++){
    if(load[i].trim().equals(name)){
    println("Found one");
    x = i;
    p.name = load[i].trim();
    p.score = Integer.parseInt(load[i+1].trim());
    println("Load Score: " + load[i+1]);
    return true;
    }
    }
    println("Not found");
    return false;    
    }
    
    void loadGame(){
    load = loadStrings("leaderboard.txt");
    }
}
