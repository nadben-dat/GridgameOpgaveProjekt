//player
float px, py; //x and y
float pSize = 15;
float fovSize = 200; //size of field-of-view
float flicker = 255; //controls field-of-view opacity 255 = 100% 0 = 0%
boolean flickerN = true;
  //movement
boolean aDown = false;
boolean sDown = false;
boolean dDown = false;
boolean wDown = false;

//enemies
int arrayS = 10; //determines number of enemies 
float[] eX = new float[arrayS];
float[] eY = new float[arrayS];
float[] speedX = new float[arrayS]; 
float[] speedY = new float[arrayS]; 

//line detection
int lArraySize = 119; //determines the size of the array
//line co-ordinates
float[] lx1 = new float[lArraySize];
float[] lx2 = new float[lArraySize];
float[] ly1 = new float[lArraySize];
float[] ly2 = new float[lArraySize];

//background colour
color mazeCol = color(0,0,0);

//nightmare mode
boolean nightMare = false;
int nm = 2;
float nmBonus = 0;

//score
float score = 0;
float highScore = 0;

//reset
boolean reset = false;

//moosick
/*
import processing.sound.*; //importing SoundFile library
//background music
SoundFile backgroundMusic; 
*/
