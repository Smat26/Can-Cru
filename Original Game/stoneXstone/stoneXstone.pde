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
Login login;
ControlP5 controlP5;
controlP5.Button b;
controlP5.Textfield t;
int stoneSize=40;
void setup() {
   controlP5 = new ControlP5(this);
   minim = new Minim(this);
   menu = new Menu(); // Goto menus constructor for any changes

}
void draw() {

   menu.show();
   //for custom cursor
  //image(menu.cursor,mouseX,mouseY); 
   
}
void mouseClicked() {
 lvl.click();
  menu.clickEvent();
}
void controlEvent(ControlEvent theEvent) {
  
     
if(theEvent.controller().name()=="                                          Login") {
      p.name = controlP5.get(Textfield.class, "Name").getText();
      p.searchName();
      b.hide();
      t.hide();
      menu.temp = 3;
      universal = lvl;
      
    }

}
