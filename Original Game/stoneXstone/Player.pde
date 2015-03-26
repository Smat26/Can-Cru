class Player{

    String name = "Anonymous";
    int score;
    String []load;
    String [] list;
    
    void saveGame(){
    loadGame();
    list = new String[load.length+2];
    for(int i=0;i<load.length;i++){
    list[i] = load[i];
    }
    list[load.length] = name;
    list[load.length+1] = Integer.toString(score);
    saveStrings("leaderboard.txt", list);
    }
    
        
    void searchName(){
    loadGame();
    for(int i=0;i<load.length;i+=2){
    if(load[i].trim().equals(name)){
    println("Found one");
    p.name = load[i].trim();
    p.score = Integer.parseInt(load[i+1].trim());
    return;
    }
    }
    println("Not found");
    }
    
    void loadGame(){
    load = loadStrings("leaderboard.txt");
    }
}
