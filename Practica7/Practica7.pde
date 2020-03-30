//import ddf.minim.*;
class Note {
  boolean white;
  int pitch;
  public Note(boolean white, int pitch){
    this.white = white;
    this.pitch = pitch;
  }
}

  


import arb.soundcipher.*;

int userNote, userPos;
int pentaMode;  

SoundCipher sc = new SoundCipher(this);
int initialPos = 100;
int pentagramSep = 20;
int initialPosNote = 90;


int[] doremiPos = {initialPos+pentagramSep*5//do
                  ,pentagramSep/2 +initialPos+pentagramSep*4
                  ,initialPos+pentagramSep*4
                  ,pentagramSep/2 +initialPos+pentagramSep*3
                  ,initialPos+pentagramSep*3
                  ,pentagramSep/2 +initialPos+pentagramSep*2
                  ,initialPos+pentagramSep*2
                  ,pentagramSep/2 +initialPos+pentagramSep*1
                  ,initialPos+pentagramSep*1
                  ,initialPos + pentagramSep/2
                  ,initialPos
                  ,initialPos - pentagramSep/2
                  ,initialPos - pentagramSep
                  ,initialPos - 3*pentagramSep/2
                  };
Note[] notas;


int starterDo;



void setup(){
  size(1700,700);
  background(255);
  notas = new Note[32];
  /*for (int i = 0 ; i< 14; i++){
    notas[i] = new Note(i%2 == 0,i);
  }*/
  starterDo = 36;
  userPos = 0;
  userNote = 0;
  pentaMode = 0;
  
  //minim = new Minim(this);
  //OUT = minim.getLineOut( Minim.STEREO );
}

void draw(){
  background(255);
  drawUserPos();
  stroke(1);
  drawPentagramLines();
  drawNotes();
  
  
}

void drawUserPos(){
 fill(100);
 noStroke();
 rect(initialPosNote + userPos*44.44 + (userPos/8)*44.44 - 10,initialPos - 50,20,initialPos + pentagramSep * 4);
}

void drawPentagramLines(){
  int octateSep = 400;
  int initialPosOct = 50;
  //Draw pentagram octates
  for (int posX = initialPosOct; posX <= initialPosOct + octateSep*4 ; posX += octateSep ){
    line(posX,initialPos - 10 ,posX,10+initialPos+pentagramSep * 4);  
  }
  //Draw pentagram lines
  for (int posY = initialPos; posY <= initialPos + pentagramSep * 4 ; posY += pentagramSep ){
    line(50,posY ,1650,posY);  
  }
  
  
}

void drawNotes(){
  
  
  int cont = 0;
  for(Note note : notas){
    if(note != null){
      if(note.white) fill(255);
      else fill(0);
      circle(initialPosNote + cont*44.44 + (cont/8)*44.44,doremiPos[note.pitch],20); 
    }
    cont++; 
  }
}
  




void playMusicote(){
  print("Tocando Musicote");
  float[] pitches = {0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0};
  float[] durations = {0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0};                  
  float [] dynamics = {0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0,
                     0,0,0,0,0,0,0,0};
  int cont = 0;
  for(Note note : notas){
    if(note == null){
      dynamics[cont] = 0;
      durations[cont] = 0.5;
    }else{
      if (note.white) durations[cont] = 1;
      else durations[cont] = 0.5;
      dynamics[cont] = 80;
      int octave = note.pitch/7;
      int freqPlus = (note.pitch*2 - min(((note.pitch%7)/3),1));
      pitches[cont] = starterDo + (freqPlus - octave*2)  ;
    }
    cont++;
  }


                
  sc.playPhrase(pitches, dynamics, durations);

}

void updateNote(){
  switch (pentaMode){
    case 0:
      notas[userPos] = null;
      break;
    case 1:
      notas[userPos] = new Note(false,userNote);
      break;
    case 2:
      notas[userPos] = new Note(true,userNote);
      break;
  }
}


void keyReleased(){
  if (keyCode == ENTER){
    playMusicote();
  }
  if (key == 'B' || key == 'b'){
    pentaMode = 2;
    updateNote();
  }
  
  if (key == 'N' || key == 'n'){
    pentaMode = 1;
    updateNote();
  }
  
  if (key == 'M' || key == 'm'){
    pentaMode = 0;
    updateNote();
  }
  
  if(keyCode == UP){
    if(userNote != 13) userNote++;
    updateNote();
  }
  
  if(keyCode == DOWN){
    if(userNote != 0) userNote--;
    updateNote();
  }
  
  if(keyCode == LEFT){
    if(userPos != 0) userPos--;
    if(notas[userPos] != null) userNote = notas[userPos].pitch;
  }
  
  if(keyCode == RIGHT){
    if(userPos != 31) userPos++;
    if(notas[userPos] != null) userNote = notas[userPos].pitch;
  }
}
