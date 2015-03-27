class Leaderboard implements Display {
  String[] leaderboard = new String[100];
  Boolean added=false;
  
  void loadLeader() {
    leaderboard = loadStrings("/data/text/Leader.txt");
    println("leaderboard loaded");
  }
  void saveleader() {
    saveStrings("/data/text/Leader.txt", leaderboard);
    println("leaderboard saved");
  }
  void addLeader() {
    for (int i =0; i <leaderboard.length; i+=2) {
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
      for (int i =0; i<leaderboard.length; i+=2) {
        if (leaderboard[i]==null) {
          leaderboard[i]= p.name;
          leaderboard[i+1] =""+ p.score;
          println("New Entry added");
        }
      }
    }
    added=false;
  }


  void display() {
  }
}

