/**
 * Fonction permettant de changer de map
 * @param currentMapID [ID de la map affichée]
 * @param direction    [direction vers laquelle se dirige le joueur (haut, bas, gauche ou droite)]
 */
void loadMap(int currentMapID, int direction)
{
  switch (direction)//On incrémente l'ID de la map de 1 lorsque l'on va vers la droite, de 10
                    //lorsque l'on va vers le haut
                    //On décrémente l'ID de la map de 1 lorsque l'on va vers la gauche, de 10
                    //lorsque l'on va vers le bas
  {
    case 1://left
      currentMapID--;
      mapID = currentMapID;
      break;
    case 2://right
      currentMapID++;
      mapID = currentMapID;
      break;
    case 3://up
      currentMapID += 10;
      mapID = currentMapID;
      break;
    case 4://down
      currentMapID -= 10;
      mapID = currentMapID;
      break;
  }

  switch (mapID)//Lit la map en fonction de l'ID 
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

  //Génération de la map à partir du fichier texte
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
 * Appelle la fonction loadMap lorsque la limite de la map affichée est franchie
 */
void setBounds() { //Rappel pour la fonction loadMap, 2eme param: 1 = left, 2 = right, 3 = up, 4 = down
  if (player1.getxPlayerPos() < 0) 
  {
    player1.setxPlayerPos(760);
    loadMap(mapID, 1);
  }else if (player1.getxPlayerPos() > 760)
  {
    player1.setxPlayerPos(0);
    loadMap(mapID, 2);
  }
  if (player1.getyPlayerPos() <= 0)
  {
    player1.setyPlayerPos(540);
    loadMap(mapID, 3);
  }else if (player1.getyPlayerPos() >= 540)
  {
    player1.setyPlayerPos(0);
    loadMap(mapID, 4);
  }
}

/**
 * Fonction permettant de calculer les collisions en comparant la position du personnage dans le tableau de blocs
 * avec l'ID des blocs présents sur cette position
 * @param  testID    [ID du bloc à tester]
 * @param  direction [Direction du personnage]
 * @return           [Retourne vrai s'il n'y a pas de collisions, et que le personnage peut avancer,
 *                             Sinon, retourne faux]
 */
boolean testCollisionID(int testID, int direction)
{
  player1.calculTab();
  boolean result = false;
  switch (direction)
  {
    case 1:
      player1.setxOnTab((player1.getxPlayerPos()+4)/20);
      player1.setyOnTab(player1.getyPlayerPos()/20);
      break;
    case 2:
      player1.setxOnTab((player1.getxPlayerPos()-3)/20);
      player1.setyOnTab(player1.getyPlayerPos()/20);
      break;
    case 3:
      player1.setxOnTab(player1.getxPlayerPos()/20);
      player1.setyOnTab((player1.getyPlayerPos()-player1.getSpeedY())/20);
      break;
    case 4:
      player1.setxOnTab(player1.getxPlayerPos()/20);
      player1.setyOnTab((player1.getyPlayerPos()+player1.getSpeedY())/20);
      break;
  }

  switch (direction)
  {
    case 1: //droite
      if ((blocTab[player1.getxOnTab()+1][player1.getyOnTab()] != testID) && 
        (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+1] != testID) && 
        (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+2] != testID))
      {
        result = true;
      }else{
        result = false;
      }
      break;
    case 2: //gauche
      if ((blocTab[player1.getxOnTab()][player1.getyOnTab()] != testID) && 
        (blocTab[player1.getxOnTab()][player1.getyOnTab()+1] != testID) && 
        (blocTab[player1.getxOnTab()][player1.getyOnTab()+2] != testID))
      {
        result = true;
      }else{
        result = false;
      }
      break;
    case 3: //up
      if ((blocTab[player1.getxOnTab()][player1.getyOnTab()] != testID) && 
        (blocTab[player1.getxOnTab()+1][player1.getyOnTab()] != testID))
      {
        result = true;
      }else{
        result = false;
      }
      break;
    case 4: //down, avec playerY+3 > 29
      if ((blocTab[player1.getxOnTab()][player1.getyOnTab()+2] != testID) && 
        (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+2] != testID))
      {
        result = true;
      }else{
        result = false;
      }
      break;
    case 5: //down, avec playerY+3 < 29
      if ((blocTab[player1.getxOnTab()][player1.getyOnTab()+3] != testID) && 
        (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+3] != testID))
      {
        result = true;
      }else{
        result = false;
      }
      break; 
  }
  return result;
}

/**
 * Vérifie si le personnage passe sur un point de sauvegarde
 * PS: Pardon pour le peu de lisibilité.
 */
void isOnCheckpoint()
{
  if (blocTab[player1.getxOnTab()][player1.getyOnTab()] == 16)
  {
    blocTab[player1.getxOnTab()][player1.getyOnTab()] = 17;
    player1.setRespawnX(player1.getxPlayerPos());
    player1.setRespawnY(player1.getyPlayerPos());
    player1.setRespawnMap(mapID);
  }else if (blocTab[player1.getxOnTab()+2][player1.getyOnTab()] == 16)
  {
    blocTab[player1.getxOnTab()+2][player1.getyOnTab()] = 17;
    player1.setRespawnX(player1.getxPlayerPos());
    player1.setRespawnY(player1.getyPlayerPos());
    player1.setRespawnMap(mapID);
  }else if (blocTab[player1.getxOnTab()][player1.getyOnTab()+1] == 16)
  {
    blocTab[player1.getxOnTab()][player1.getyOnTab()+1] = 17;
    player1.setRespawnX(player1.getxPlayerPos());
    player1.setRespawnY(player1.getyPlayerPos());
    player1.setRespawnMap(mapID);
  }else if (blocTab[player1.getxOnTab()+2][player1.getyOnTab()+1] == 16)
  {
    blocTab[player1.getxOnTab()+2][player1.getyOnTab()+1] = 17;
    player1.setRespawnX(player1.getxPlayerPos());
    player1.setRespawnY(player1.getyPlayerPos());
    player1.setRespawnMap(mapID);
  }else if (blocTab[player1.getxOnTab()][player1.getyOnTab()+2] == 16)
  {
    blocTab[player1.getxOnTab()][player1.getyOnTab()+2] = 17;
    player1.setRespawnX(player1.getxPlayerPos());
    player1.setRespawnY(player1.getyPlayerPos());
    player1.setRespawnMap(mapID);
  }else if (blocTab[player1.getxOnTab()+2][player1.getyOnTab()+2] == 16)
  {
    blocTab[player1.getxOnTab()+2][player1.getyOnTab()+2] = 17;
    player1.setRespawnX(player1.getxPlayerPos());
    player1.setRespawnY(player1.getyPlayerPos());
    player1.setRespawnMap(mapID);
  }
}

/**
 * Vérifie si le joueur est sur des pics, fonction malheureusement non factorisée/optimisée
 */
void isOnSpike()
{
  if ((blocTab[player1.getxOnTab()][player1.getyOnTab()] == 12) ||
      (blocTab[player1.getxOnTab()][player1.getyOnTab()] == 13) ||
      (blocTab[player1.getxOnTab()][player1.getyOnTab()] == 14) ||
      (blocTab[player1.getxOnTab()][player1.getyOnTab()] == 15))
  {
    player1.death();
  }
  else if ((blocTab[player1.getxOnTab()+1][player1.getyOnTab()] == 12) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()] == 13) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()] == 14) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()] == 15))
  {
    player1.death();
  }
  else if ((blocTab[player1.getxOnTab()][player1.getyOnTab()+1] == 12) ||
           (blocTab[player1.getxOnTab()][player1.getyOnTab()+1] == 13) ||
           (blocTab[player1.getxOnTab()][player1.getyOnTab()+1] == 14) ||
           (blocTab[player1.getxOnTab()][player1.getyOnTab()+1] == 15)) 
  {
    player1.death();
  }
  else if ((blocTab[player1.getxOnTab()+1][player1.getyOnTab()+1] == 12) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+1] == 13) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+1] == 14) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+1] == 15)) 
  {
    player1.death();
  }
  else if ((blocTab[player1.getxOnTab()][player1.getyOnTab()+2] == 12) ||
           (blocTab[player1.getxOnTab()][player1.getyOnTab()+2] == 13) ||
           (blocTab[player1.getxOnTab()][player1.getyOnTab()+2] == 14) ||
           (blocTab[player1.getxOnTab()][player1.getyOnTab()+2] == 15))
  {
    player1.death();
  }
  else if ((blocTab[player1.getxOnTab()+1][player1.getyOnTab()+2] == 12) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+2] == 13) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+2] == 14) ||
           (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+2] == 15))
  {
    player1.death();
  }
}

/**
 * Fonction appelée lorsqu'un bloc magique est récupéré, afin de les cacher
 * @param newMapID [ID de la map dont le bloc doit être 'caché']
 */
void hiddenForever(int newMapID)
{
  switch (newMapID)
  {
    case 42:
      blocIsTaken[0] = true;
      break;
    case 82:
      blocIsTaken[1] = true;
      break;
    case 65:
      blocIsTaken[2] = true;
      break;
    case 66:
      blocIsTaken[3] = true;
      break;
    case 83:
      blocIsTaken[4] = true;
      break;
    case 81:
      blocIsTaken[5] = true;
      break;
    case 52:
      blocIsTaken[6] = true;
      break;
  }
}

/**
 * Fonction appelée dans la fonction draw, pour s'assurer que les blocs soient 'cachés'
 */
void hideBloc()
{
  if ((mapID == 42 && blocIsTaken[0] == true) ||
      (mapID == 82 && blocIsTaken[1] == true) ||
      (mapID == 65 && blocIsTaken[2] == true) ||
      (mapID == 66 && blocIsTaken[3] == true) ||
      (mapID == 83 && blocIsTaken[4] == true) ||
      (mapID == 81 && blocIsTaken[5] == true) ||
      (mapID == 52 && blocIsTaken[6] == true))
  {
    for (int i = 0; i < 40; i++) {
      for (int j = 0; j < 30; j++) {
        if (blocTab[i][j] == 18) {
          blocTab[i][j] = 0;
        } 
      }
    }
  }
}

/**
 * Vérifie si un joueur se trouve sur un bloc magique
 */
void isOnMagicBloc()
{
  if (blocTab[player1.getxOnTab()][player1.getyOnTab()] == 18) {
    blocTab[player1.getxOnTab()][player1.getyOnTab()] = 0;
    countBloc++;
    hiddenForever(mapID);
  }else if (blocTab[player1.getxOnTab()+1][player1.getyOnTab()] == 18) {
    blocTab[player1.getxOnTab()][player1.getyOnTab()] = 0;
    countBloc++;
    hiddenForever(mapID);
  }else if (blocTab[player1.getxOnTab()][player1.getyOnTab()+1] == 18) {
    blocTab[player1.getxOnTab()][player1.getyOnTab()] = 0;
    countBloc++;
    hiddenForever(mapID);
  }else if (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+1] == 18) {
    blocTab[player1.getxOnTab()][player1.getyOnTab()] = 0;
    countBloc++;
    hiddenForever(mapID);
  }else if (blocTab[player1.getxOnTab()][player1.getyOnTab()+2] == 18) {
    blocTab[player1.getxOnTab()][player1.getyOnTab()] = 0;
    countBloc++;
    hiddenForever(mapID);
  }else if (blocTab[player1.getxOnTab()+1][player1.getyOnTab()+2] == 18) {
    blocTab[player1.getxOnTab()][player1.getyOnTab()] = 0;
    countBloc++;
    hiddenForever(mapID);
  }
}

/**
 * Fonction qui vérifie si le joueur à récupéré les 7 blocs magiques,
 * une cinématique de fin n'a malheureusement pas pu être implémentée par
 * manque de temps
 */
void winCondition()
{
  if (countBloc >= 7)
  {
    println("You Win !!");
    jack.mute();
    fanfare.play();
  }
}