class Leaderboard implements Display {
  String[] leaderboard = new String[100];
  String[] tmp;
  Boolean added=false;
  
  void loadLeader() {
    tmp = loadStrings("/data/text/Leader.txt");
    println("leaderboard loaded");
    for(int i = 0; i<tmp.length;i++){
    leaderboard[i] = tmp[i];
    }
    println(leaderboard.length);
  }
  void saveLeader() {
    saveStrings("/data/text/Leader.txt", leaderboard);
    println("leaderboard saved");
  }
  void addLeader() {
    for (int i =0; i <tmp.length; i+=2) {
      if (leaderboard[i].equals(p.name)) {
        if (p.score> Integer.parseInt(leaderboard[i+1])) {
          leaderboard[i+1]=""+ p.score;
          println("New Score is higher");
        } else {
          println("Previous Score was higher");
        }
        added = true;
      }
    }
    if (!added) {
      for (int i =0; i<leaderboard.length; i++) {
        if (leaderboard[i].equals("null")) {
          println("adding name");
          leaderboard[i]= p.name;
          leaderboard[i+1] =""+ p.score;
          break;
          //println("New Entry added");
        }
       
      }
    }
    added=false;
  }


  void display() {
  }
}

