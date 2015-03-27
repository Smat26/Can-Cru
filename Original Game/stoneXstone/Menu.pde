//This is the menu class
//Menu should have following buttons
class Menu {
  
  int temp = 0;
 int tempPop = -1; 
 PImage cursor;

  Menu() {
    //======================Startup===========================/    
    size(800,700); 
    noStroke(); 
    smooth();
    //noCursor();
    cursor = loadImage("/data/Various/whitecursor.png");
    lvl = new Level();
    main = new MainScreen();
    login = new Login();
    login.startup();
    universal = main;
    lvl.loadImages(); //loads images of themes   
    exit = new Exit();
    blank = new Blank();
    components = blank;
     p = new Player();
     ui = new LevelUI();
     a = new AudioSystem("song.mp3");
     a.loopIt();
         lvl.setTheme();
     //============================================
  }

  void show() {
    //The line below messed up the console output :(
    //println("MouseX: "+ mouseX);
    //println("MouseY: "+ mouseY);
  
    universal.display();
    components.display();
    
}
 
 //This function checks that which mouse was clicked in a specified region or not
  
  boolean mouseCheck(float x1, float y1, float x2, float y2) {
    if (mouseX >= x1 && mouseX <= x2 && mouseY>=y1 && mouseY<=y2) {
      //println("true");
      return true;
    }
    return false;
  }
  
  
// This function determines the button which is clicked and dynamically displays the appropriate screen
  void clickEvent(){
  if (mouseCheck(main.allx, 50+main.d, main.allx2, 100+main.d) && temp == 0){
          temp = 1;
    }
  if (mouseCheck(main.allx, 130+main.d, main.allx2, 190+main.d) && temp == 0){
    
          temp = 1;
    }
  if (mouseCheck(width-50, 0, width, 100) && (temp == 3 || temp == -1)){
          if(temp == 3){
          temp = -1;
          }
          else{
          temp = 3;
          }
    }
  if (mouseCheck(main.allx, 290+main.d, main.allx2, 370+main.d) && temp == 0){
    
          tempPop = 1;
    }  
    
  //=========================//  
    if(temp == 0){
    universal = main;   
    }
    if(temp == 1){
    login.initialize();
    universal = login;
    }
    if(temp == 3 || temp == -1){
    universal = lvl;
    }
    if(tempPop == 1){
    components = exit;
    }
    
    //======================//
  
  }
}
