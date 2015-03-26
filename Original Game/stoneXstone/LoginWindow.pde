import controlP5.*;
class Login implements Display{
 void initialize(){

 controlP5.show();
 }
 void display(){
 // initialize();
  background(255);
  
 }
 void startup(){
 t  = controlP5.addTextfield("Name")
    .setPosition(240, 150)
      .setSize(200, 40);
    controlP5.hide();
    b = controlP5.addButton("                                          Login",1,240,250,200,40);
 }

}
