class Leaderboard implements Display {
  String[] leaderboard = new String[100];
  String[] tmp;
  Boolean added=false;

  void loadLeader() {
    tmp = loadStrings("/data/text/Leader.txt");
    println("leaderboard loaded");
    for (int i = 0; i<tmp.length; i++) {
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
    //just added code bwlow to check
    // scoreSorter();
  }
  //code below not working
  void scoreSorter() {
    String x;
    String y;
    for (int i=1; i<leaderboard.length; i+=2) {
      for (int j=1; j < leaderboard.length-1; j+=2 ) {
        if (leaderboard[j+2].equals("null")) {
          break;
        }
        if (Integer.parseInt(leaderboard[j]) < Integer.parseInt(leaderboard[j+2])) {
          x=leaderboard[j];
          y = leaderboard[j-1];
          leaderboard[j]=leaderboard[j+2];
          leaderboard[j-1]= leaderboard[j+1];
          ;
          leaderboard[j+2]=x;
          leaderboard[j+1]= y;
        }
        if (leaderboard[j].equals(leaderboard[j+2])) {
          leaderboard[j]="0";
        }
      }
    }
  }


  void display() {
    textSize((width+height)/40);
    fill(#ED4158);
    text("1) " + leaderboard[0], width/6, height/3.2);
    text("2) " + leaderboard[1], width/6, height/2.35);
    text("3) " + leaderboard[2], width/6, height-height/2.15);
    text("4) " + leaderboard[3], width/6, height-height/2.75);
    text("5) " + leaderboard[4], width/6, height-height/4);
    text("6) " + leaderboard[5], width-width/2.2, height/3.2);
    text("7) " + leaderboard[6], width-width/2.2, height/2.35);
    text("8) " + leaderboard[7], width-width/2.2, height-height/2.15);
    text("9) " + leaderboard[8], width-width/2.2, height-height/2.75);
    text("10) " + leaderboard[9], width-width/2.2, height-height/4);
  }
}

