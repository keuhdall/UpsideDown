int xPos   =  0;
int yPos   =  0;
int xPos2  =  0;
int yPos2  =  0;
int Xtab   =  0;
int Ytab   =  0;
int Xtab2  =  0;
int Ytab2  =  0;
int blocID =  0;
int value  =  0;
PrintWriter outputFile;
BufferedReader reader;
String line;
int[][] blocTab = new int[40][30];

PFont font;
PImage currentBloc;

PImage bloc0;
PImage bloc1;
PImage bloc2;
PImage bloc3;
PImage bloc4;
PImage bloc5;
PImage bloc6;
PImage bloc7;
PImage bloc8;
PImage bloc9;
PImage bloc10;
PImage bloc11;
PImage blocMagic;
PImage spikeup;
PImage spikedown;
PImage spikeleft;
PImage spikeright;
PImage save_off;
PImage save_on;

PImage bloc0_sample;
PImage bloc00_sample;
PImage bloc1_sample;
PImage bloc2_sample;
PImage bloc3_sample;
PImage bloc4_sample;
PImage bloc5_sample;
PImage bloc6_sample;
PImage bloc7_sample;
PImage bloc8_sample;
PImage bloc9_sample;
PImage blocMagic_sample;
PImage spikeUp_sample;
PImage spikeDown_sample;
PImage spikeLeft_sample;
PImage spikeRight_sample;
PImage save_sample;

void setup()
{
  size(960, 600);
  background(100);

  currentBloc =  loadImage ("imgs/testImg1A.png");
  bloc0       =  loadImage ("imgs/testImg0.png");
  bloc1       =  loadImage ("imgs/testImg1A.png");
  bloc2       =  loadImage ("imgs/testImg2A.png");
  bloc3       =  loadImage ("imgs/bloc1a.png");
  bloc4       =  loadImage ("imgs/bloc2a.png");
  bloc5       =  loadImage ("imgs/bloc3a.png");
  bloc6       =  loadImage ("imgs/bloc4a.png");
  bloc7       =  loadImage ("imgs/bloc5a.png");
  bloc8       =  loadImage ("imgs/bloc6a.png");
  bloc9       =  loadImage ("imgs/bloc7a.png");
  bloc10      =  loadImage ("imgs/bloc8a.png");
  bloc11      =  loadImage ("imgs/bloc9a.png");
  blocMagic   =  loadImage ("imgs/blocMagic.png");
  spikeup     =  loadImage ("imgs/spikeup1.png");
  spikedown   =  loadImage ("imgs/spikedown1.png");
  spikeleft   =  loadImage ("imgs/spikeleft1.png");
  spikeright  =  loadImage ("imgs/spikeright1.png");
  save_off    =  loadImage ("imgs/save_off1.png");
  save_on     =  loadImage ("imgs/save_on1.png");

  bloc0_sample      =  loadImage ("imgs/testImg1B.png");
  bloc00_sample     =  loadImage ("imgs/testImg2B.png");
  bloc1_sample      =  loadImage ("imgs/bloc1b.png");
  bloc2_sample      =  loadImage ("imgs/bloc2b.png");
  bloc3_sample      =  loadImage ("imgs/bloc3b.png");
  bloc4_sample      =  loadImage ("imgs/bloc4b.png");
  bloc5_sample      =  loadImage ("imgs/bloc5b.png");
  bloc6_sample      =  loadImage ("imgs/bloc6b.png");
  bloc7_sample      =  loadImage ("imgs/bloc7b.png");
  bloc8_sample      =  loadImage ("imgs/bloc8b.png");
  bloc9_sample      =  loadImage ("imgs/bloc9b.png");
  blocMagic_sample  =  loadImage ("imgs/blocMagic_sample.png");
  spikeUp_sample    =  loadImage ("imgs/spikeup2.png");
  spikeDown_sample  =  loadImage ("imgs/spikedown2.png");
  spikeLeft_sample  =  loadImage ("imgs/spikeleft2.png");
  spikeRight_sample =  loadImage ("imgs/spikeright2.png");
  save_sample       =  loadImage ("imgs/save_off2.png");

  outputFile =  createWriter("map.txt");
  reader     =  createReader("ed.txt");
  font       =  createFont("ArialBlack.ttf", 32);

  for (int i = 0; i < 40; i++) {
    for (int j = 0; j < 30; j++) {
      blocTab[i][j] = 0;
    }
  }
}

class bloc
{
  int x;
  int y;
  int ID;
  
  bloc(int newX, int newY, int newID){
    x = newX;
    y = newY;
    ID = newID;
  }
  
  void drawBloc(){
    switch (ID)
    {
      case 0:
        image(bloc0, x, y);
        break;
      case 1:
        image(bloc1, x, y);
        break;
      case 2:
        image(bloc2, x, y);
        break;
      case 3:
        image(bloc3, x, y);
        break;
      case 4:
        image(bloc4, x, y);
        break;
      case 5:
        image(bloc5, x, y);
        break;
      case 6:
        image(bloc6, x, y);
        break;
      case 7:
        image(bloc7, x, y);
        break;
      case 8:
        image(bloc8, x, y);
        break;
      case 9:
        image(bloc9, x, y);
        break;
      case 10:
        image(bloc10, x, y);
        break;
      case 11:
        image(bloc11, x, y);
        break;
      case 12:
        image(spikeup, x, y);
        break;
      case 13:
        image(spikedown, x, y);
        break;
      case 14:
        image(spikeleft, x, y);
        break;
      case 15:
        image(spikeright, x, y);
        break;
      case 16:
        image(save_off, x, y);
        break;
      case 17:
        image(save_on, x, y);
        break;
      case 18:
        image(blocMagic, x, y);
        break;
    }
  }
}

void readMap()
{
  for (int i = 0; i < 800; i+=20) {
    for (int j = 0; j < 600; j+=20) {
      try {
        line = reader.readLine();
        if (line != null){
          value = int(line);
          bloc newBloc = new bloc(i, j, value);
          newBloc.drawBloc();
          blocTab[Xtab][Ytab] = value;
          Ytab++;
          }
        }catch (IOException e) {
          e.printStackTrace();
          line = null;
      }
    }
    Ytab = 0;
    Xtab++;  
  }
}

void writeMap()
{
 outputFile.flush();
 for (int i=0; i < 40; ++i)
  {
    for (int j=0; j < 30; ++j)
    {
      outputFile.println(blocTab[i][j]);
    }
  }
  outputFile.flush();//NEW
  outputFile.close();//NEW
}

void draw()
{
  //Affiche d'une "preview" des blocs dans la palette, ces blocs sont de dimension 40x40
  image(bloc0_sample, 800, 0);
  image(bloc00_sample, 840, 0);
  image(bloc1_sample, 880, 0);
  image(bloc2_sample, 920, 0);
  image(bloc3_sample, 800, 40);
  image(bloc4_sample, 840, 40);
  image(bloc5_sample, 880, 40);
  image(bloc6_sample, 920, 40);
  image(bloc7_sample, 800, 80);
  image(bloc8_sample, 840, 80);
  image(bloc9_sample, 880, 80);
  image(spikeUp_sample, 920, 80);
  image(spikeDown_sample, 800, 120);
  image(spikeLeft_sample, 840, 120);
  image(spikeRight_sample, 880, 120);
  image(save_sample, 920, 120);
  image(blocMagic_sample, 800, 160);
  rect(800+120, 520, 40, 40);
  
  /*
  rect(800+40, 160, 40, 40);
  rect(800+80, 160, 40, 40);
  rect(800+120, 160, 40, 40);
  rect(800+0, 200, 40, 40);
  rect(800+40, 200, 40, 40);
  rect(800+80, 200, 40, 40);
  rect(800+120, 200, 40, 40);
  rect(800+0, 240, 40, 40);
  rect(800+40, 240, 40, 40);
  rect(800+80, 240, 40, 40);
  */

  // Lignes horizontales du cadrillage de la palette
  line(800, 0, 800, 600);
  line(800, 40, 1000, 40);
  line(800, 80, 1000, 80);
  line(800, 120, 1000, 120);
  line(800, 160, 1000, 160);
  line(800, 200, 1000, 200);
  line(800, 240, 1000, 240);
  line(800, 280, 1000, 280);
  line(800, 320, 1000, 320);
  line(800, 360, 1000, 360);
  line(800, 400, 1000, 400);
  line(800, 440, 1000, 440);
  line(800, 480, 1000, 480);
  line(800, 520, 1000, 520);

  // Lignes verticales du cadrillage de la palette
  line(840, 0, 840, 600);
  line(880, 0, 880, 600);
  line(920, 0, 920, 600);
  
  // Affiche les bouttons "save" et "load"
  rect(800+0, 560, 80, 60);
  rect(800+80, 560, 80, 60);
  fill(0);
  text("save", 830, 585);
  text("load", 910, 585);
  fill(255);
  //image(currentBloc, 940, 570);

  if ((mousePressed) && (mouseX <= 800 ))
  {
    xPos = mouseX;
    yPos = mouseY;
    
    if (xPos < 0)
    {
      xPos = 0;
    }if (xPos > 780)
    {
      xPos = 780;
    }if (yPos < 0)
    {
      yPos = 0;
    }if (yPos > 580)
    {
      yPos = 580;
    }
    xPos /= 20;
    yPos /= 20;
    xPos *= 20;
    yPos *= 20;
    xPos2 = xPos/20;
    yPos2 = yPos/20;
    

    //rect(xPos, yPos, 20, 20);
    image(currentBloc, xPos, yPos);
    blocTab[xPos2][yPos2] = blocID;
    //println("X = ", xPos2, " Y = ", yPos2, "ID = ", blocTab[xPos2][yPos2]);
  }else if ((mousePressed) && (mouseX > 800))
  {
    xPos = mouseX;
    yPos = mouseY;
    xPos /= 40;
    yPos /= 40;
    xPos *= 40;
    yPos *= 40;
    xPos2 = xPos/20;
    yPos2 = yPos/20;
    
    switch (xPos2)
    {
      case 40:
        switch (yPos2)
        {
          case 0:
            currentBloc = loadImage("imgs/testImg1A.png");
            blocID = 1;
            break;
          case 2:
            currentBloc = loadImage("imgs/bloc3a.png");
            blocID = 5;
            break;
          case 4:
            currentBloc = loadImage("imgs/bloc7a.png");
            blocID = 9;
            break;
          case 6:
            currentBloc = loadImage("imgs/spikedown1.png");
            blocID = 13;
            break;
          case 8:
            currentBloc = loadImage("imgs/blocMagic.png");
            blocID = 18;
            break;
          case 28:
          writeMap();
          break;
        }
        break;
      case 42:
        switch (yPos2)
        {
          case 0:
            currentBloc = loadImage("imgs/testImg2A.png");
            blocID = 2;
            break;
          case 2:
            currentBloc = loadImage("imgs/bloc4a.png");
            blocID = 6;
            break;
          case 4:
            currentBloc = loadImage("imgs/bloc8a.png");
            blocID = 10;
            break;
          case 6:
            currentBloc = loadImage("imgs/spikeleft1.png");
            blocID = 14;
            break;            
          case 28:
            writeMap();
            break;
        }
        break;
      case 44:
        switch (yPos2)
        {
          case 0:
            currentBloc = loadImage("imgs/bloc1a.png");
            blocID = 3;
            break;
          case 2:
            currentBloc = loadImage("imgs/bloc5a.png");
            blocID = 7;
            break;
          case 4:
            currentBloc = loadImage("imgs/bloc9a.png");
            blocID = 11;
            break;
          case 6:
            currentBloc = loadImage("imgs/spikeright1.png");
            blocID = 15;
            break;
          case 28:
            readMap();
            break;
        }
        break;
      case 46:
        switch (yPos2)
        {
          case 0:
            currentBloc = loadImage("imgs/bloc2a.png");
            blocID = 4;
            break;
          case 2:
            currentBloc = loadImage("imgs/bloc6a.png");
            blocID = 8;
            break;
          case 4:
            currentBloc = loadImage("imgs/spikeup1.png");
            blocID = 12;
            break;
          case 6:
            currentBloc = loadImage("imgs/save_off1.png");
            blocID = 16;
            break;
          case 26:
            currentBloc = loadImage("imgs/testImg0.png");
            blocID = 0;
            break;
          case 28:
            readMap();
            break;
        }
        break;
    } 
  }
  


  println("xPos = ", xPos, " yPos = ", yPos);
  println("xPos2 = ", xPos2, " yPos2 = ", yPos2);
} 