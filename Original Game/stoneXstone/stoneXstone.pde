Display universal;
MainScreen main;
Player p;
Menu menu;
Level lvl;
Login login;
ControlP5 controlP5;
controlP5.Button b;
controlP5.Textfield t;
int stoneSize=25;
void setup() {
   controlP5 = new ControlP5(this);
   menu = new Menu(); // Goto menus constructor for any changes

}
void draw() {
   menu.show();
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
      menu.temp = 1;
      
    }

}
