import ddf.minim.*;

class AudioSystem{

  AudioPlayer player;
  AudioInput input;
  AudioSystem(String str){
    player = minim.loadFile(str); 
    
  }
  void loopIt(){
    player.loop();
  }
  void play(){
  player.play();    
  }
    void stopIt(){
  player.pause();    
  }


}
