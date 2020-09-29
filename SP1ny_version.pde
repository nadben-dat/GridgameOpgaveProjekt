/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */
 
import java.util.Random;
import processing.sound.*;
Sound s;


float x; 
float y;
float targetX, targetY;
float easing =.5;

float x1; 
float y1;
float targetX1, targetY1;
float vitesse =.4;




/*void setup ()
{
  noCursor();
  size (600,600);
  smooth();
  }*/


Game game = new Game(30, 20, 5);
PFont font;

public void settings() {
  size(1201, 801);
}

void setup()
{
  frameRate(10);
    font = createFont("Arial", 16, true);
    textFont(font, 16);
{
//sets start position
  px = 25; 
  py = 25;
  //enemy array
  for(int n = 0; n < arrayS; n += 1){
    eX[n] = random(100,700);
    eY[n] = random(100,700);
    speedX[n] = random(-1.5,1.5);
    speedY[n] = random(-1.5,1.5);
    
    // Play two sine oscillators with slightly different frequencies for a nice "beat".
  SinOsc sin = new SinOsc(this);
  sin.play(200, 0.2);
  sin = new SinOsc(this);
  sin.play(205, 0.2);

  // Create a Sound object for globally controlling the output volume.
  s = new Sound(this);
  }
}
}
  
  
  


void keyReleased()
{
  game.onKeyReleased(key);
}

void keyPressed()
{
  game.onKeyPressed(key);
}



void draw()
{
  
  /*background(51);
  
  targetX=mouseX;
  float dx=targetX -x;
  if (abs(dx) > 1) {
    x+=dx * vitesse;
  }
  targetY=mouseY;
  float dy=targetY -y;
  if(abs(dy) > 1) {
    y += dy *vitesse;
  }
  
  rect(x,y, 33,33);*/
  
  background(255);
  noFill();
  stroke(0);
  strokeWeight(2);
  int columns = 15;
  int cellWidth = 25;
  int halfGridWidth = ((columns * cellWidth)/ 2);
  int rows = 20;
  int cellHeight = 15;
  int halfGridHeight = ((rows * cellHeight)/2);
  fill(0,255,0);
  {
  if(aDown)
  {
   x = x - 25;
   aDown = false;
    if(x < 313) x = 313;
  }
  if(dDown)
  {
    x = x + 25;
    dDown = false;
    if(x >= 663) x = 663 ;
  }
  if(wDown)
  {
    y = y - 15;
    wDown = false;
    if(y < 350) y = 350;
  }
  if(sDown)
  {
    y = y + 15 ;
    sDown = false;
    if(y >= 635) y = 635 ;
  }
  //rect(313,350,25,15);
  rect(x,y,25,15);

  drawGrid(500 - halfGridWidth, 500 - halfGridHeight, columns, rows, cellWidth, cellHeight, true);


}
}
void drawGrid(int x, int y, int columns, int rows, int cellWidth, int cellHeight, boolean red)
{
  if(red)
  {
    stroke(255,0,0);
  }
  else
  {
    stroke(0,255,0);
  }
  //Draw vertical lines
  int column = 0;

  while(column <= columns)
  {
    line(x+column*cellWidth,y,x+column*cellWidth, y+rows*cellHeight);
    column = column + 1;
  }

  //Draw horizontal lines
  int row = 0;
  while(row <= rows)
  {
    line(x,y+row*cellHeight, x+columns*cellWidth, y+row*cellHeight);
    row = row + 1;
  }

}
void keyReleased()
{
  if (key == 'A' || key == 'a')
  {
    aDown = false;
  }
  else if(key == 'D' || key == 'd')
  {
    dDown = false;
  }
  else if(key == 'W' || key == 'w')
  {
    wDown = false;
  }
  else if(key == 'S' || key == 's')
  {
    sDown = false;
  }
}

void keyPressed()
{
  if (key == 'A' || key == 'a')
  {
    aDown = true;
  }
  else if(key == 'D' || key == 'd')
  {
    dDown = true;
  }
  else if(key == 'W' || key == 'w')
  {
    wDown = true;
  }
  else if(key == 'S' || key == 's')
  {
    sDown = true;
  }
}
 /*// n = n +1;
    //y starts on 15
  lx1[n] = mC*1; ly1[n] = mC*15; lx2[n] = mC*5; ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*2; ly1[n] = mC*15; lx2[n] = mC*2; ly2[n] = mC*16;
  n = n +1;
  lx1[n] = mC*6; ly1[n] = mC*15; lx2[n] = mC*12; ly2[n] = mC*15;
  n = n +1;
  lx1[n] = mC*12; ly1[n] = mC*15; lx2[n] = mC*12; ly2[n] = mC*16;
  n = n +1;
  lx1[n] = mC*13; ly1[n] = mC*15; lx2[n] = mC*13; ly2[n] = mC*16;
  n = n +1;*/
}

//debug mode
/*
void mouseDragged() {
  px = mouseX;
  py = mouseY;
}
*/
  
  
  
  game.update();
  background(0); //Black
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  int[][] board = game.getBoard();
  for (int y = 0; y < game.getHeight(); y++)
  {
    for (int x = 0; x < game.getWidth(); x++)
    {
      if(board[x][y] == 0)
      {
        fill(0,0,0);
      }
      else if(board[x][y] == 1)
      {
        fill(0,0,255);
      }
      else if(board[x][y] == 2)
      {
        fill(255,0,0);
      }
      else if(board[x][y] == 3)
      {
        fill(0,255,0);
      }
      stroke(100,100,100);
      rect(x*40, y*40, 40, 40);
    }
  }
  {
  fill(255);
  text("Lifes: "+game.getPlayerLife(), 25,25);
  
  {
    targetX=mouseX;
  float dx=targetX -x;
  if (abs(dx) > 1) {
    x+=dx * easing;
  }
  targetY=mouseY;
  float dy=targetY -y;
  if(abs(dy) > 1) {
    y += dy * easing;
  }
  
 
  fill(0,255,0);
  rect(x,y,40,40);
 
  {
    
    targetX1=mouseX;
  float dx1=targetX1 +x1;
  if (abs(dx1) > 1) {
    x1+=dx1 * vitesse;
  }
  
  
  targetY1=mouseY;
  float dy1=targetY1 -y1;
  if(abs(dy) < 1) {
    y1 -= dy1 * vitesse;
      }
      fill(0,0,255);
  rect(x,y, 33-40*2,33-40*2);
  
  // Map vertical mouse position to volume.
  float amplitude = map(mouseY, 0, height, 0.4, 0.0);

  

  // Instead of setting the volume for every oscillator individually, we can just
  // control the overall output volume of the whole Sound library.
  s.volume(amplitude);
  
  
   background(mazeCol);
  //field of view
  fov(px, py, fovSize);
  flickerOn();
  //maze
  maze();
  //declaring lines based on maze() values
  for (int n = 0; n < lArraySize; ++n) {
    strokeWeight(6);
    stroke(mazeCol);
    line(lx1[n], ly1[n], lx2[n], ly2[n]);
  
  //exit
  exitGate();
  //portal
  portal();
  //player
  player(px, py);
  //controls
  controls();
  //enemies
 enemy(arrayS);
  //hit detection and subsequent reset
  hit();
  //resets the reset, ironically
 reset = false;
  //displays instructions
 instructions();
  //score
  score();
  //win condition
  win();
  //nightmare mode
  
  //nightMare(nightMare);
  
  void controls(){
  //controls
  //checks if nightmare mode is on, and if so, doubles speed
  if(aDown && nightMare){
    px = px -2;
  }else if(aDown){
    px = px -1;
  }
  if(dDown && nightMare){
    px = px +2;
  }else if(dDown){
    px = px +1;
  }
  if(wDown && nightMare){
    py = py -2;
  }else if(wDown){
    py = py -1;
  }
  if(sDown && nightMare){
    py = py +2;
  }else if(sDown){
    py = py +1;
  }
}

void exitGate(){ //visualising exit
  if(px > width-150 && py > height-100){
    strokeWeight(6);
    stroke(255);
    fill(255);
    line(width-100,height,width,height); //door
    //lightcone tracking player
    if(px > width-100 && py > height-75){ 
      noStroke();
      fill(255,100);
      beginShape();
      vertex(width-100,height);
      vertex(width,height);
      vertex(px,py);
      endShape(CLOSE);
    }
  }
}

void portal(){ 
  //from 325,375 to 525,725
  //one-way portal
  strokeWeight(4);
  ellipseMode(CENTER);
  if(px > 200 && px < 350 && py > 350 && py < 400){ //make portal visible only when near
    //light-cone
    noStroke();
    fill(255,100);
    beginShape();
    vertex(325,375-10);
    vertex(325,375+10);
    vertex(px,py);
    endShape();
    //orange portal (entry)
    stroke(255,94,19); 
    fill(0);
    ellipse(325,375,20,35);
    if(px > 325-5 && px < 325+5 && py > 375-17 && py < 375+17){ //teleport
      px = 525;
      py = 725;
    }
  }
  if(px > 500 && px < 550 && py > 650 && py < 750){
    //light-cone
    noStroke();
    fill(255,100);
    beginShape();
    vertex(525-17,725);
    vertex(525+17,725);
    vertex(px,py);
    endShape();
    //blue portal (exit)
    stroke(57,138,215); 
    fill(0);
    ellipse(525,725,35,20);
  }
}

void fov(float x, float y, float size) {
  noStroke();
  fill(150,flicker);
  circle(x, y, size);
}

void flickerOn(){
  float n = -5;
  if(flicker >= 255){
    flickerN = true;
  }
  if(flicker <= 0){
    flickerN = false;
  }
  if(!flickerN){
    flicker -= n;
  }else if(flickerN){
    flicker += n;
  } 
}

void player(float x, float y) {
  strokeWeight(3);
  stroke(0);
  fill(252, 194, 104);
  circle(x, y, pSize);
}

void enemy(int n){
  fovSize = 200;
  for(n = 0; n < arrayS-(arrayS-nm); n += 1){
    eX[n] = eX[n] - speedX[n];
    eY[n] = eY[n] - speedY[n];
    if(eX[n] < px+pSize*6 && eY[n] < py+pSize*6 && eX[n] > px-pSize*6 && eY[n] > py-pSize*6){
      fovSize = 100; //makes your fov smaller when enemies are nearby
    }
    //enemies
    strokeWeight(2);
    stroke(mazeCol);
    fill(mazeCol);
    //diamond shape
    beginShape();
    vertex(eX[n],eY[n]-pSize*2);
    vertex(eX[n]+pSize*2,eY[n]);
    vertex(eX[n],eY[n]+pSize*2);
    vertex(eX[n]-pSize*2,eY[n]);
    endShape(CLOSE);
    //eyes
    noStroke();
    if(mazeCol != color(0)){
     fill(255, 255, 255);
    }else{
     fill(255,0,0);
    }
    circle(eX[n]-5,eY[n],5);
    circle(eX[n]+5,eY[n],5);
    if(eX[n] >= 800-pSize*2){
      speedX[n] = speedX[n] *-1;
    }
    if(eX[n] <= 0+pSize*2){
      speedX[n] = speedX[n] *-1;
    }
    if(eY[n] >= 800-pSize*2){
      speedY[n] = speedY[n] *-1;
    }
    if(eY[n] <= 0+pSize*2){
      speedY[n] = speedY[n] *-1;
    }
    if(eX[n] < px+pSize*2 && eY[n] < py+pSize*2 && eX[n] > px-pSize*2 && eY[n] > py-pSize*2){
      reset = true;
    }
  }
}

void hit() {
  for (int n = 0; n < lArraySize; ++n) {
    boolean hit = lineCircle(lx1[n], ly1[n], lx2[n], ly2[n], px, py, pSize/2);
    if (hit || reset) {
      px = 25; 
      py = 25;
      score = 0;
      //resets enemies
      if(!nightMare){
        for(int n2 = 0; n2 < arrayS; n2 += 1){
          speedX[n2] = random(-1.5,1.5);
          speedY[n2] = random(-1.5,1.5);
        }
      }else{
        for(int n3 = 0; n3 < arrayS; n3 += 1){
          speedX[n3] = random(-3,3);
          speedY[n3] = random(-3,3);
        }
      }
    }
  }
}

void score(){
  //checks if a highScore already exists (i.e. is bigger than 0)
  //if it doesn't, highScore is set to the value of score
  //if it does, highScore is only set to the value of score if it's lower
  if(highScore < score && highScore == 0 && win()){
    highScore = score;
  }else if(highScore > score && score > 0 && win()){
    highScore = score;
  }
  textAlign(CENTER,BOTTOM);
  textSize(25);
  fill(252, 194, 104);
  text("Fastest Time: "+(int)highScore/60,650,30);
  text("Current Time: "+(int)score/60,150,30);
  score = score +(1-nmBonus);
}

boolean win(){
  if(py >= height){
    reset = true;
    return true;
  }
  return false;
}

void instructions(){
  if(px < 150 && py < 50){
    textAlign(CENTER,BOTTOM);
    textSize(60);
    fill(252, 194, 104);
    text("Find the Exit!",width/2,height/2);
    textSize(30);
    text("Move with Arrow-keys or W,A,S,D",width/2,height/2+50);
    strokeWeight(5);
    stroke(252, 194, 104);
    line(765,725,765,775);
    line(765,775,750,760);
    line(765,775,780,760);
  }
}

void nightMare(boolean nmOn){
  if(nmOn){
    nm = arrayS;
    mazeCol = color(155,0,0);
    nmBonus = 0.5; //slows down counter by 50%, making it possible to get times as low as 25 seconds
  }else{
    nm = arrayS/2;
    mazeCol = color(0);
    nmBonus = 0;
  }
  
  
    }

}
}
