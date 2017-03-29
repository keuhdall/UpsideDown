import ddf.minim.*;

Minim minim;
AudioPlayer jumpSound;
AudioPlayer deathSound;
AudioPlayer jack;
AudioPlayer fanfare;

void setup()
{
  size(800, 600);
  playerImg  =  loadImage ("sprites/character/characterD.png");
  bloc0      =  loadImage ("sprites/testImg0.png");
  bloc1      =  loadImage ("sprites/testImg1A.png");
  bloc2      =  loadImage ("sprites/testImg2A.png");
  bloc3      =  loadImage ("sprites/bloc1a.png");
  bloc4      =  loadImage ("sprites/bloc2a.png");
  bloc5      =  loadImage ("sprites/bloc3a.png");
  bloc6      =  loadImage ("sprites/bloc4a.png");
  bloc7      =  loadImage ("sprites/bloc5a.png");
  bloc8      =  loadImage ("sprites/bloc6a.png");
  bloc9      =  loadImage ("sprites/bloc7a.png");
  bloc10     =  loadImage ("sprites/bloc8a.png");
  bloc11     =  loadImage ("sprites/bloc9a.png");
  blocMagic  =  loadImage ("sprites/blocMagic.png");
  spikeup    =  loadImage ("sprites/spikeup1.png");
  spikedown  =  loadImage ("sprites/spikedown1.png");
  spikeleft  =  loadImage ("sprites/spikeleft1.png");
  spikeright =  loadImage ("sprites/spikeright1.png");
  save_off   =  loadImage ("sprites/save_off1.png");
  save_on    =  loadImage ("sprites/save_on1.png");
  enemy      =  loadImage ("sprites/testImg1B.png");
  reader     =  createReader ("maps/map50.txt");
  minim      =  new Minim(this);
  jumpSound  =  minim.loadFile("sounds/jump.mp3");
  deathSound =  minim.loadFile("sounds/no.mp3");
  jack       =  minim.loadFile("sounds/jack.mp3");
  fanfare    =  minim.loadFile("sounds/fanfare.mp3");
  jack.loop();
  
  for (int i = 0; i < 800; i+=20) {
    for (int j = 0; j < 600; j+=20) {
      try {
        line = reader.readLine();
        if (line != null) {
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

  for (int k = 0; k < 7; k++) {
    blocIsTaken[k] = false;
  }
}


void draw()
{
  Xtab2 = 0;
  Ytab2 = 0;
  player1.calculTab();
  player1.setGravity(rightSide, gravity);  
  
  for (int i = 0; i < 40; i++) {
    for (int j = 0; j < 30; j++) {
      switch(blocTab[i][j])
      {
        case 0:
          image(bloc0,      Xtab2,  Ytab2);
          break;
        case 1:
          image(bloc1,      Xtab2,  Ytab2);
          break;
        case 2:
          image(bloc2,      Xtab2,  Ytab2);
          break;
        case 3:
          image(bloc3,      Xtab2,  Ytab2);
          break;
        case 4:
          image(bloc4,      Xtab2,  Ytab2);
          break;
        case 5:
          image(bloc5,      Xtab2,  Ytab2);
          break;
        case 6:
          image(bloc6,      Xtab2,  Ytab2);
          break;
        case 7:
          image(bloc7,      Xtab2,  Ytab2);
          break;
        case 8:
          image(bloc8,      Xtab2,  Ytab2);
          break;
        case 9:
          image(bloc9,      Xtab2,  Ytab2);
          break;
        case 10:
          image(bloc10,     Xtab2,  Ytab2);
          break;
        case 11:
          image(bloc11,     Xtab2,  Ytab2);
          break;
        case 12:
          image(spikeup,    Xtab2,  Ytab2);
          break;
        case 13:
          image(spikedown,  Xtab2,  Ytab2);
          break;
        case 14:
          image(spikeleft,  Xtab2,  Ytab2);
          break;
        case 15:
          image(spikeright, Xtab2,  Ytab2);
          break;
        case 16:
          image(save_off,   Xtab2,  Ytab2);
          break;
        case 17:
          image(save_on,    Xtab2,  Ytab2);
          break;
        case 18:
          image(blocMagic,  Xtab2,  Ytab2);
          break;
        default:
          image(bloc0,      Xtab2,  Ytab2);
      }
      //rect(Xtab2, Ytab2, 20, 20);
      Ytab2 += 20;
    }
    Xtab2 += 20;
    Ytab2 = 0;
  }
  
  if (keyPressed)
  {
    if (key == 'd')
    {
      rightSide = true;
      player1.animate(rightSide, gravity);
      if ((testCollisionID(2, 1)  == true) && //solution temporaire dégeu...
          (testCollisionID(3, 1)  == true) &&
          (testCollisionID(4, 1)  == true) &&
          (testCollisionID(5, 1)  == true) &&
          (testCollisionID(6, 1)  == true) &&
          (testCollisionID(7, 1)  == true) &&
          (testCollisionID(8, 1)  == true) &&
          (testCollisionID(9, 1)  == true) &&
          (testCollisionID(10, 1) == true) &&
          (testCollisionID(11, 1) == true)) 
      {
        player1.setxPlayerPos(player1.getxPlayerPos()+player1.getSpeedX());
      }
    }
    else if (key == 'q')
    {
      rightSide = false;
      if ((testCollisionID(2, 2)  == true) &&
          (testCollisionID(3, 2)  == true) &&
          (testCollisionID(4, 2)  == true) &&
          (testCollisionID(5, 2)  == true) &&
          (testCollisionID(6, 2)  == true) &&
          (testCollisionID(7, 2)  == true) &&
          (testCollisionID(8, 2)  == true) &&
          (testCollisionID(9, 2)  == true) &&
          (testCollisionID(10, 2) == true) &&
          (testCollisionID(11, 2) == true))
      {
        player1.setxPlayerPos(player1.getxPlayerPos()-player1.getSpeedX());
      }
    }
    
    if ((key == ' ') && (pending == false))
    {
      jumpSound.play();
      jumpSound.rewind();
      if (gravity == true)
      {
        gravity = false;
      }else{
        gravity = true;
      }
    }
  }
 
  if (gravity == false)
  {
    if ((testCollisionID(2, 3)  == true)  &&
        (testCollisionID(3, 3)  == true)  &&
        (testCollisionID(4, 3)  == true)  &&
        (testCollisionID(5, 3)  == true)  &&
        (testCollisionID(6, 3)  == true)  &&
        (testCollisionID(7, 3)  == true)  &&
        (testCollisionID(8, 3)  == true)  &&
        (testCollisionID(9, 3)  == true)  &&
        (testCollisionID(10, 3) == true)  &&
        (testCollisionID(11, 3) == true))
    {
      if ( player1.getyPlayerPos() > 0)
      {
        player1.setyPlayerPos(player1.getyPlayerPos()-player1.getSpeedY());
        pending = true;
      }else{
        pending = false;
      }
    }else{
      pending = false;
    }
  }
  else if (gravity == true)
  {
    if (player1.getyOnTab()+3 > 29)
    {
      if ((testCollisionID(2, 4)  == true) &&
          (testCollisionID(3, 4)  == true) &&
          (testCollisionID(4, 4)  == true) &&
          (testCollisionID(5, 4)  == true) &&
          (testCollisionID(6, 4)  == true) &&
          (testCollisionID(7, 4)  == true) &&
          (testCollisionID(8, 4)  == true) &&
          (testCollisionID(9, 4)  == true) &&
          (testCollisionID(10, 4) == true) &&
          (testCollisionID(11, 4) == true))
      {
        if (player1.getyPlayerPos() < 540)
        {
          player1.setyPlayerPos(player1.getyPlayerPos()+player1.getSpeedY());
          pending = true;
        }else{
          pending = false;
        }
      }else{
        pending = false;
      }      
    }else{
      if ((testCollisionID(2, 5)  == true) &&
          (testCollisionID(3, 5)  == true) &&
          (testCollisionID(4, 5)  == true) &&
          (testCollisionID(5, 5)  == true) &&
          (testCollisionID(6, 5)  == true) &&
          (testCollisionID(7, 5)  == true) &&
          (testCollisionID(8, 5)  == true) &&
          (testCollisionID(9, 5)  == true) &&
          (testCollisionID(10, 5) == true) &&
          (testCollisionID(11, 5) == true))
      {
        if (player1.getyPlayerPos() < 540)
        {
          player1.setyPlayerPos(player1.getyPlayerPos()+player1.getSpeedY());
          pending = true;
        }else{
          pending = false;
        }
      }else{
        pending = false;
      }    
    }
  }
  setBounds();
  isOnCheckpoint();
  isOnSpike();
  isOnMagicBloc();
  hideBloc();
  player1.draw();
  winCondition();
  println("Blocs magiques récupérés : ", countBloc);
}