class MainScreen implements Display{

PImage backImg,extNorm,hsNorm,ldNorm,stNorm,ext,hs,ld,st;
PImage sun;

float allx = 310;
float allx2 = allx+135;

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
  rotate(PI/10);
 image(sun,-300,-300);
 rotate(-PI/10);
 
 image(stNorm, allx,50);
 image(ldNorm, allx,130);
 image(hsNorm, allx,210);
 image(extNorm, allx,290);
 
 
 //Display Hover state
 if(menu.mouseCheck(allx,50,allx2,100)){
 image(st, allx,50);
 }
 if(menu.mouseCheck(allx,130,allx2,190)){
 image(ld, allx,130);
 }
 if(menu.mouseCheck(allx,210,allx2,280)){
 image(hs, allx,210);
 }
 if(menu.mouseCheck(allx,290,allx2,370)){
 image(ext, allx,290);
 }

}


}
