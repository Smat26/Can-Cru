class MainScreen implements Display{

PImage backImg,extNorm,hsNorm,ldNorm,stNorm,ext,hs,ld,st;
PImage sun;

float allx = 450;  //control x coordinate of the WHOLE menu
float allx2 = allx+135;
float y=0;
float d=90; //calculate Y coordinate of the whole menu
MainScreen(){
 backImg = loadImage("background.png");
 extNorm = loadImage("exit_normal.png");
 hsNorm = loadImage("highscore_normal.png");
 ldNorm = loadImage("loading_normal.png");
 stNorm = loadImage("start_normal.png");
 st = loadImage("start.png");
 ld = loadImage("Loading.png");
 hs = loadImage("hover.png");
 ext = loadImage("exit.png");
 sun = loadImage("data/Various/sun.png");
}

void display(){
  y+=0.01;
  rotate(PI/10+y);
  background(255);
 image(sun,-300,-300);
 rotate(-(PI/10+y));
 
 image(stNorm, allx,50+d);
 image(ldNorm, allx,130+d);
 image(hsNorm, allx,210+d);
 image(extNorm, allx,290+d);
 
 
 //Display Hover state
 if(menu.mouseCheck(allx,50+d,allx2,100+d)){
 image(st, allx,50+d);
 }
 if(menu.mouseCheck(allx,130+d,allx2,190+d)){
 image(ld, allx,130+d);
 }
 if(menu.mouseCheck(allx,210+d,allx2,280+d)){
 image(hs, allx,210+d);
 }
 if(menu.mouseCheck(allx,290+d,allx2,370+d)){
 image(ext, allx,290+d);
 }
 
}


}
