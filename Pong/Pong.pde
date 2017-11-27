boolean up = false;
boolean down = false;

boolean is_left = false;

boolean up2 = false;
boolean down2 = false;

int x = 499;
int y = 250;

int xspeed = 0;
int yspeed = 0;

int xPaddle = 200;
int yPaddle = 250;
int yPaddleSpeed = 10;

int xPaddle2 = 800;
int yPaddle2= 250;
int yPaddle2Speed = 10;

int score1 = 0;
int score2 = 0;

void setup() {
  size(1000, 500);
  textSize(50);
}
void draw() {

  background(0);
  fill(255);
  textSize(50);
  text(score2, 530, 130);
  text(score1, 430, 130);
  rect(100, 0, 800, 10);
  rect(100, 490, 800, 10);
  for(int i = 0; i < 25; i++){
    rect(500, i*20, 10, 10);
  }
  stroke(0);
  ellipse(x, y, 10, 10);
  fill(255);
  rect(xPaddle, yPaddle, 10, 50);
  rect(xPaddle2, yPaddle2, 10, 50);
  if (up==true) {
    yPaddle=yPaddle-yPaddleSpeed;
  }
  if (down==true) {
    yPaddle=yPaddle+yPaddleSpeed;
  }
  if (up2==true) {
    yPaddle2=yPaddle2-yPaddle2Speed;
  }
  if (down2==true) {
    yPaddle2=yPaddle2+yPaddle2Speed;
  }
  x = x + xspeed;
  y = y + yspeed;
  
  if (x>width) {
    score1++;
    x=500;
    xspeed = 0;
    yspeed = 0;
    is_left = false;
  }
  if (x<0) {
    score2++;
    x=500;
    xspeed = 0;
    yspeed = 0;
    is_left = true;
  }
  if (y>height-15) {
    yspeed=-yspeed;
  }
  if (y<15) {
    yspeed=-yspeed;

    ellipse(x, y, 10, 10);
  }
  if (yPaddle<10) {
    yPaddle = 10;
  }
  if (yPaddle2<10) {
    yPaddle2 = 10;
  }
  if (yPaddle>height-60) {
    yPaddle = 440;
  }
  if (yPaddle2>height-60) {
    yPaddle2 = 440;
    fill(255);
    rect(xPaddle, yPaddle, 10, 50);
    rect(xPaddle2, yPaddle2, 10, 50);
  }
    if (intersect(x, y, xPaddle, yPaddle, 50)) {
      xspeed=-xspeed;
      yspeed--;
    }
    if (intersect(x, y, xPaddle2, yPaddle2, 50)) {
      xspeed=-xspeed;
      yspeed--;
    }
  
}
void keyPressed() {
  if (key == ' '){
    if(is_left){
    xspeed = 4;
    }
    else{
    xspeed = -4;
    }
    yspeed = 3;
  }
  if (keyCode == UP) {
    up2=true;
  }
  if (keyCode == DOWN) {
    down2=true;
  }
  if (key == 'w') {
    up=true;
  }
  if (key == 's') {
    down=true;
  }
}
void keyReleased() {
  if (keyCode == UP) {
    up2=false;
  }
  if (keyCode == DOWN) {
    down2=false;
  }
  if (key == 'w') {
    up=false;
  }
  if (key == 's') {
    down=false;
  }
}

boolean intersect(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {

  if (ballY > paddleY && ballX > paddleX && ballX < paddleX + 10&& ballY < paddleY + paddleLength)
    return true;
  else
    return false;
}