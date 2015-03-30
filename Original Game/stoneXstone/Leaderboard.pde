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

  }

  void orderLeader() {
    String[] num = leaderboard;
    String hold;
    boolean flag = false;
    do {
      flag = false;
      for ( int j=1; j < num.length -2; j+=2 )
      {
        if (num[j+2].equals("null")) {

          break;
        }
        
        if ( Integer.parseInt(num[ j ]) < Integer.parseInt(num[j+2]) )   // change to > for ascending sort
        {
          //swapping score
          hold = num[ j ];                //swap elements
          num[ j ] = num[ j+2 ];
          num[ j+2 ] = hold;

          //swapping names:
          hold = num[j-1];
          num[j-1] = num[j+1];
          num[j+1] = hold;
          flag = true;
            // println("swap");
        }
      }
    }
    while (flag);
    for (int i=0; i<num.length; i++) {
      println(num[i]);
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

