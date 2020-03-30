
import arb.soundcipher.*;

class Note {
  boolean white;
  int pitch;
  public Note(boolean white, int pitch){
    this.white = white;
    this.pitch = pitch;
  }
}

class Chord  {
  Note[] acorde;
  
  public Chord(){
    acorde = new Note[14];  
    for (int i = 0; i < 14; i++){
     acorde[i] = null;
    }
  }
  
  public void addNote(boolean white,int pos){
    acorde[pos] = new Note(white,pos);
  }
  
  public void deleteNote(int pos){
    acorde[pos] = null;
  }
  
  public Note[] getChord(){
    return acorde;
  }
}

double position = 64;
//My Things
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
Chord[] notas;


int starterDo;

SCScore score;

boolean partyMode;

void setup(){
  size(1700,700);
  background(255);
  startNotas();
  starterDo = 36;
  userPos = 0;
  userNote = 0;
  pentaMode = 0;
  
  partyMode = false;
  
}

void draw(){
  background(255);
  strokeWeight(1);
  drawUserPos();
  stroke(0);
  drawPentagramLines();
  drawNotes();
  drawInstructions();
  drawUserNote();
  
}

void drawUserPos(){
 fill(100);
 noStroke();
 rect(initialPosNote + userPos*44.44 + (userPos/8)*44.44 - 10,initialPos - 50,20,initialPos + pentagramSep * 4);
}

void drawUserNote(){
  stroke(170);
  strokeWeight(5);
  float start = initialPosNote + userPos*44.44 + (userPos/8)*44.44 - 10;
  line(start,doremiPos[userNote] ,start+20,doremiPos[userNote]);
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
  for(Chord chord : notas){
    for(Note note: chord.getChord()){
      if(note != null){
        if(note.white) fill(255);
        else fill(0);
        circle(initialPosNote + cont*44.44 + (cont/8)*44.44,doremiPos[note.pitch],20); 
      }
    }
    cont++; 
  }
}
  



void playMusicote(){
  score = new SCScore();

  int cont = 0;
  for(Chord chord : notas){
    for(Note note: chord.getChord()){
      double duration;
      if(note != null){
        if (note.white) duration = 1;
        else duration = 0.5;
        int octave = note.pitch/7;
        int freqPlus = (note.pitch*2 - min(((note.pitch%7)/3),1));
        //pitches[cont] = starterDo + (freqPlus - octave*2) ; 
        float artic=64;
        if (partyMode) artic = random(128); 
        score.addNote((cont/2.0) + 1,0,0,starterDo + (freqPlus - octave*2),80,duration,0.8,artic);
        println("   duracion =  " + duration);
        println("   Empieza =  " + cont/2.0);
      }
    }
    cont++;
  }
  
  //score.addPhrase(0, 0, 34,pitches,dynamics,durations,articulations,pans);
  score.play();
  println("Tocando Musicote");              
  //sc.playPhrase(pitches, dynamics, durations);
  println("Terminando Musicote");
}


void drawInstructions(){
  
}


void startNotas(){
  notas = new Chord[32];
  for (int i = 0; i < 32; i++){
    notas[i] = new Chord();
  }
}

void keyReleased(){
  if (keyCode == ENTER){
    sc.stop();
    playMusicote();
  }
  if (key == 'B' || key == 'b'){
    //pentaMode = 2;
    notas[userPos].addNote(true,userNote);
  }
  
  if (key == 'N' || key == 'n'){
    //pentaMode = 1;
    notas[userPos].addNote(false,userNote);
  }
  
  if (key == 'M' || key == 'm'){
    //pentaMode = 0;
    notas[userPos].deleteNote(userNote);
  }
  
  if (key == 'P' || key == 'p'){
    partyMode = !partyMode;
  }
  
  if (key == 'R' || key == 'r'){
    startNotas();
  }
  
  if(keyCode == UP){
    position++;
    if(userNote != 13) userNote++;
  }
  
  if(keyCode == DOWN){
    position--;
    if(userNote != 0) userNote--;
  }
  
  if(keyCode == LEFT){
    if(userPos != 0) userPos--;
    //if(notas[userPos] != null) userNote = notas[userPos].pitch;
  }
  
  if(keyCode == RIGHT){
    if(userPos != 31) userPos++;
    //if(notas[userPos] != null) userNote = notas[userPos].pitch;
  }
}
