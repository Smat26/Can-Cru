AudioSystem a;
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

int stoneSize=40;
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
 lvl.click();
  menu.clickEvent();
}

