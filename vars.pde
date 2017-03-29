int[][] blocTab =  new int[50][40];
int blocID      =  0;
int value       =  0;
int mapID       =  50;
int countBloc   =  0;
int Xtab        =  0;
int Ytab        =  0;
int Xtab2       =  0;
int Ytab2       =  0;

boolean[] blocIsTaken =  new boolean[7];
boolean gravity       =  true;
boolean rightSide     =  true;
boolean pending       =  false;
/*
RAPPEL:
0 = mapID 42
1 = mapID 82
2 = mapID 65
3 = mapID 66
4 = mapID 83
*/
PImage playerImg;
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
PImage enemy;

BufferedReader reader;
String line;
player player1 = new player(110, 360, 4, 5);