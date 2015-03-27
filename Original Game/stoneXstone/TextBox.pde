class TextBox{
    String text = "";
    PFont f;
    float x,y;
    color c;
    float s;
    TextBox(float x, float y, color c){
    f = createFont("Arial",16,true);
    this.x = x;
    this.y = y;
    this.c = c;
    }
    void setSize(float s){
    this.s = s;
    }
    void show(){
      textSize(s);
      fill(c);
      stroke(5);
      text(text,x,y);
    
    }
    void listen(){
    
    if(key == BACKSPACE && !text.isEmpty()){
    text = text.substring(0, text.length()-1);
    }
     else{
       
       if(text.length() > 12){
       println("Limit exceeded");
       return;
       }
       
     text += key;
    
    }
    
    }


}
