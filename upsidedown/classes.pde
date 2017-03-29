class bloc
{
  int x;
  int y;
  int ID;
  
  /**
   * Constructeur de la classe bloc
   * @param newX [position x (en pixels) du bloc]
   * @param newY [position y (en pixels) du bloc]
   * @param newID [ID du bloc]
   */
  bloc(int newX, int newY, int newID) {
    x = newX;
    y = newY;
    ID = newID;
  }  
  
  /**
   * Affiche le bloc en fonction de son ID
   */
  void drawBloc() {
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
        image(bloc11, x, y);
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
    }
  }
}

class player
{
  int xPlayerPos;
  int yPlayerPos;
  int xOnTab;
  int yOnTab;
  int speedX;
  int speedY;
  int respawnX;
  int respawnY;
  int respawnMap;

  /**
   * Constructeur de la classe player
   * @param newX [position x (en pixels) du joueur]
   * @param newY [position y (en pixels) du joueur]
   * @param newSpeedX [vitesse du joueur sur l'axe des abscisses]
   * @param newSpeedY [vitesse du joueur sur l'axe des ordonnées]
   */
  player(int newX, int newY, int newSpeedX, int newSpeedY) {
    xPlayerPos = newX;
    yPlayerPos = newY;
    speedX = newSpeedX;
    speedY = newSpeedY;
  }

  /**
   * Permet de calculer la position du joueur dans le tableau de blocs
   */
  void calculTab()
  {
    xOnTab = xPlayerPos/20;
    yOnTab = yPlayerPos/20;
    xOnTab *= 20;
    yOnTab *= 20;
    xOnTab /= 20;
    yOnTab /= 20;    
  }

  /**
   * Permet d'afficher l'image du personne correspondante à la gravité du jeu
   * (mais aussi à son orientation droite/gauche)
   * @param rightSide [Est vrai si le personnage doit regarder vers la droite, sinon faux]
   * @param gravity   [Est vrai si la gravité du jeu est "normale",
   * faux si la gravité est inversée]
   */
  void setGravity(boolean rightSide, boolean gravity) {
    if (gravity == true && rightSide == true)
    {
      playerImg = loadImage("sprites/character/characterD.png");
    }else if (gravity == false && rightSide == true)
    {
      playerImg = loadImage("sprites/character/characterRD.png"); 
    }else if (gravity == true && rightSide == false)
    {
      playerImg = loadImage("sprites/character/characterG.png");
    }else if (gravity == false && rightSide == false)
    {
      playerImg = loadImage("sprites/character/characterRG.png");
    }

  }

/**
 * Getters de la classe
 */
  int getxPlayerPos() {
    return xPlayerPos;
  }
  int getyPlayerPos() {
    return yPlayerPos;
  }
  int getxOnTab() {
    return xOnTab;
  }
  int getyOnTab() {
    return yOnTab;
  }
  int getSpeedX() {
    return speedX;
  }
  int getSpeedY() {
    return speedY;
  }
  int getRespawnX() {
    return respawnX;
  }
  int getRespawnY() {
    return respawnY;
  }
  int getRespawnMap() {
    return respawnMap;
  }

/**
 * Setters de la classe
 */
  void setxOnTab(int newXOnTab) {
    xOnTab = newXOnTab;
  }
  void setyOnTab(int newYOnTab) {
    yOnTab = newYOnTab;
  }
  void setxPlayerPos(int newXpos) {
    xPlayerPos = newXpos;
  }
  void setyPlayerPos(int newYpos) {
    yPlayerPos = newYpos;
  }
  void setRespawnX(int newRespawnX) {
    respawnX = newRespawnX;
  }
  void setRespawnY(int newRespawnY) {
    respawnY = newRespawnY;
  }
  void setRespawnMap(int newRespawnMap) {
    respawnMap = newRespawnMap;
  }

/**
 * Tue le personnage en jouant un son, et le fait réapparaitre au dernier point de sauvegarde enregistré
 */
  void death()
  {
    deathSound.play();
    deathSound.rewind();
    delay(500);
    mapID = respawnMap;
    xPlayerPos = respawnX;
    yPlayerPos = respawnY;

    switch (mapID)
    {
      case 41:
        reader = createReader("maps/map41.txt");
        break;
      case 42:
        reader = createReader("maps/map42.txt");
        break;
      case 50:
        reader = createReader("maps/map50.txt");
        break;
      case 51:
        reader = createReader("maps/map51.txt");
        break;
      case 52:
        reader = createReader("maps/map52.txt");
        break;
      case 53:
        reader = createReader("maps/map53.txt");
        break;
      case 61:
        reader = createReader("maps/map61.txt");
        break;
      case 62:
        reader = createReader("maps/map62.txt");
        break;
      case 63:
        reader = createReader("maps/map63.txt");
        break;
      case 64:
        reader = createReader("maps/map64.txt");
        break;
      case 65:
        reader = createReader("maps/map65.txt");
        break;
      case 66:
        reader = createReader("maps/map66.txt");
        break;
      case 71:
        reader = createReader("maps/map71.txt");
        break;
      case 72:
        reader = createReader("maps/map72.txt");
        break;
      case 73:
        reader = createReader("maps/map73.txt");
        break;
      case 81:
        reader = createReader("maps/map81.txt");
        break;
      case 82:
        reader = createReader("maps/map82.txt");
        break;
      case 83:
        reader = createReader("maps/map83.txt");
        break;
    }

    Xtab = 0;
    Ytab = 0;

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
  }

/**
 * affiche le personnage
 */
  void draw() {
    image(playerImg, xPlayerPos, yPlayerPos);
  }

/**
 * anime le personnage lorsqu'il est en mouvement
 * @param isOnRightSide [Est vrai si le personnage doit regarder vers la droite, sinon faux]
 * @param gravityState  [Est vrai si la gravité du jeu est "normale",
   * faux si la gravité est inversée]
 */
  void animate(boolean isOnRightSide, boolean gravityState)
  {
    if (isOnRightSide == true && gravityState == true)
    {
      playerImg = loadImage("sprites/character/characterD.png");
      delay(1);
      playerImg = loadImage("sprites/character/characterMD.png");
      delay(1);
    }else if (isOnRightSide == true && gravityState == false)
    {
      playerImg = loadImage("sprites/character/characterRD.png");
      delay(1);
      playerImg = loadImage("sprites/character/characterMDR.png");
      delay(1);      
    }else if (isOnRightSide == false && gravityState == true)
    {
      playerImg = loadImage("sprites/character/characterG.png");
      delay(1);
      playerImg = loadImage("sprites/character/characterMG.png");
      delay(1);      
    }else if (isOnRightSide == false && gravityState == false)
    {
      playerImg = loadImage("sprites/character/characterRG.png");
      delay(1);
      playerImg = loadImage("sprites/character/characterMGR.png");
      delay(1);      
    }
  }
}