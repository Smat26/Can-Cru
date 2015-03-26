import ddf.minim.*;

class AudioSystem{

  AudioPlayer player;
  AudioInput input;
  AudioSystem(String str){
    player = minim.loadFile(str); 
    player.loop();
     player.play();
  }
 


}
