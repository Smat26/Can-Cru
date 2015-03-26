//This is the menu class
//Menu should have following buttons
class Menu {
  
  int temp = 0; 

  Menu() {
    //======================Startup===========================/    
    size(800,700); 
    noStroke(); 
    smooth();
    lvl = new Level();
    main = new MainScreen();
    login = new Login();
    login.startup();
    universal = main;
    lvl.loadImages(); //loads images of themes   
     p = new Player();
     a = new AudioSystem("song.mp3");
     //============================================
  }

  void show() {
    println("MouseX: "+ mouseX);
    println("MouseY: "+ mouseY);
  
    universal.display();
    
    
}
 
 //This function checks that which mouse was clicked in a specified region or not
  
  boolean mouseCheck(float x1, float y1, float x2, float y2) {
    if (mouseX >= x1 && mouseX <= x2 && mouseY>=y1 && mouseY<=y2) {
      println("true");
      return true;
    }
    return false;
  }
  
  
// This function determines the button which is clicked and dynamically displays the appropriate screen
  void clickEvent(){
  if (mouseCheck(main.allx, 50+main.d, main.allx2, 100+main.d) && temp != 3){
          temp = 1;
    }
  if (mouseCheck(main.allx, 130+main.d, main.allx2, 190+main.d) && temp != 3){
    
          temp = 2;
    }  
    
  //=========================//  
    if(temp == 0){
    universal = main;   
    }
    if(temp == 1){
    login.initialize();
    universal = login;
    }
    if(temp == 2){
      login.initialize();
    universal = login;
    }
    if(temp == 3){
    universal = lvl;
    }
    //======================//
  
  }
}
