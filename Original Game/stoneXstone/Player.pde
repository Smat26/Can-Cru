class Player{

    String name;
    int score;
    String []load;
    String [] list;
    
    void saveGame(){
    list = new String[load.length+2];
    list[load.length] = name;
    list[load.length+1] = Integer.toString(score);
    saveStrings("leaderboard.txt", list);
    }
    
        
    void searchName(){
    load = loadStrings("leaderboard.txt");
    for(int i=0;i<load.length;i+=2){
    if(load[i].equals(name)){
    println("Found one");
    return;
    }
    }
    println("Not found");
    }



}
