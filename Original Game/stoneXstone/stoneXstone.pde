AudioSystem a;
GameOver over;
TextBox t; 
Exit exit;
Blank blank;
LevelUI ui;
Display universal;
Display components;
MainScreen main;
Player p;
Minim minim;
Menu menu;
Level lvl;
Leaderboard l;
int stoneSize=50;
void setup() {
   minim = new Minim(this);
   menu = new Menu(); // Goto menus constructor for any changes

}
void draw() {

   menu.show();
   //for custom cursor
  image(menu.cursor,mouseX,mouseY); 
   
}
void mouseClicked() {
 
  menu.clickEvent();
}
void keyPressed(){
if(menu.temp == 5){
t.listen();
}
}

