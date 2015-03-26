class Leaderboard implements Display{
  int score[] = new int[10];
  String name[] = new String[10];
  
  PImage lead;
  void initialize(){
  p.loadGame();
  for(int j = 0; j<score.length;j++){
  for(int i=1;i<p.load.length; i +=2){
  if(score[j]<Integer.parseInt(p.load[i])){
  score[j] = Integer.parseInt(p.load[i]);
  name[j] = p.load[i-1];
  }
    
  }  }
  
  }
  void display(){
  for(int i=0; i<score.length; i++){
  
    text(i+".  "+name[i]+ "   "+score[i], 200, 100);
  
  }

  }  

}
