class MainScreen implements Display {

  PImage backImg, extNorm, hsNorm, ldNorm, stNorm, ext, hs, ld, st;
  PImage sun, farm, animatch;

  float allx = 325;  //control x coordinate of the WHOLE menu
  float allx2 = allx+135;
  float y=0;
  float d=250; //control Y coordinate of the whole menu
  float tintalpha = 0;
  MainScreen() {
    backImg = loadImage("background.png");
    extNorm = loadImage("exit_normal.png");
    hsNorm = loadImage("highscore_normal.png");
    ldNorm = loadImage("loading_normal.png");
    stNorm = loadImage("start_normal.png");
    st = loadImage("start.png");
    ld = loadImage("Loading.png");
    hs = loadImage("hover.png");
    ext = loadImage("exit.png");
    sun = loadImage("data/Various/sun2.png");
    farm = loadImage("data/Various/bg2.png");
    animatch = loadImage("data/Various/animatch.png");
    imageMode(CORNER);
    background(0);

  }

  void display() {

    pushMatrix();
    tint(255, tintalpha);

if(tintalpha<255){
    tintalpha+=0.15;
}
    y+=0.01;
    image(farm, map(noise(y*0.5+mouseX*0.001), 0, 1, -1000, 100), map(noise(y*0.5+mouseY*0.001), 0, 1, -500, 25));

    rotate(PI/20+y);

    //scale(2);
    image(sun, -550, -550);
    // scale(0.5);

    rotate(-(PI/20+y));
    noTint();
    popMatrix();
    
    image(animatch, -190, -350);
    image(stNorm, allx, 50+d);
    image(ldNorm, allx, 130+d);
    image(hsNorm, allx, 210+d);
    image(extNorm, allx, 290+d);


    //Display Hover state
    if (menu.mouseCheck(allx, 50+d, allx2, 100+d)) {
      image(st, allx, 50+d);
    }
    if (menu.mouseCheck(allx, 130+d, allx2, 190+d)) {
      image(ld, allx, 130+d);
    }
    if (menu.mouseCheck(allx, 210+d, allx2, 280+d)) {
      image(hs, allx, 210+d);
    }
    if (menu.mouseCheck(allx, 290+d, allx2, 370+d)) {
      image(ext, allx, 290+d);
    }
  }
}

