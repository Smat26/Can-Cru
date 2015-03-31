class Leaderboard implements Display {
  String[] leaderboard = new String[100];
  String[] tmp;
  Boolean added=false;
  String[] num;

  PImage pic= loadImage("/data/Various/nightbg.png");
  PImage back = loadImage("/data/buttons/back/back.png");

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
    num = leaderboard;
    for (int i=0; i<num.length; i++) {
      println(num[i]);
    }
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
          println("swap");
        }
      }
    }
    while (flag);
    for (int i=0; i<num.length; i++) {
      println(num[i]);
    }
  }


  void display() {
    orderLeader();
    image(pic, 0, 0);
    
    image(back, 320, 600);
    textSize((width+height)/50);
    fill(255);
    text("1) " + num[0], width/4, 50);
    text(num[1], width/1.5, 50);
    text("2) " + num[2], width/4, 100);
    text(num[3], width/1.5, 100);
    text("3) " + num[4], width/4, 150);
    text(num[5], width/1.5, 150);
    text("4) " + num[6], width/4, 200);
    text(num[7], width/1.5, 200);
    text("5) " + num[8], width/4, 250);
    text(num[9], width/1.5, 250);
    text("6) " + num[10], width/4, 300);
    text(num[11], width/1.5, 300);
    text("7) " + num[12], width/4, 350);
    text(num[13], width/1.5, 350);
    text("8) " + num[14], width/4, 400);
    text(num[15], width/1.5, 400);
        text("9) " + num[16], width/4, 450);
    text(num[17], width/1.5, 450);
    text("10) " + num[18], width/4, 500);
    text(num[19], width/1.5, 500);
  }
}

