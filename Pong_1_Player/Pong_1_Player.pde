boolean up = false;
boolean down = false;
int score = 0;
int x = 499;
int y = 250;

int xPaddle = 100;
int yPaddle = 250;
int yPaddleSpeed = 10;
int xspeed = -3;
int yspeed = 3;
void setup() {
  size(500, 500);
  textSize(50);
}
void draw() {

  background(0);
  fill(255);
  stroke(0);
  ellipse(x, y, 10, 10);
  if (up==true) {
    yPaddle=yPaddle-yPaddleSpeed;
  }
  if (down==true) {
    yPaddle=yPaddle+yPaddleSpeed;
  }
  x = x + xspeed;
  y = y + yspeed;
  if (x>width) {
    xspeed=-xspeed;
    score++;
  }
  if (y>height) {
    yspeed=-yspeed;
  }
  if (y<0) {
    yspeed=-yspeed;
    
  }
  if (yPaddle<0) {
    yPaddle = 0;
  }
  if (yPaddle>height-50) {
    yPaddle = 450;
  }
  rect(xPaddle, yPaddle, 10, 50);
  if (intersect(x, y, xPaddle, yPaddle, 50)) {
    xspeed=-xspeed;
    yspeed--;
  }
  fill(255);
  text(score, 250, 250);
  if (x<0){
   score=0;
    x=499;
    ellipse(x, y, 10, 10);
  }
}
void keyPressed() {

  if (keyCode == UP) {
    up=true;
  }
  if (keyCode == DOWN) {
    down=true;
  }
}
void keyReleased() {
  if (keyCode == UP) {
    up=false;
  }
  if (keyCode == DOWN) {
    down=false;
  }

}

boolean intersect(int ballX, int ballY, int paddleX, int paddleY, int paddleLength) {

  if (ballY > paddleY && ballX > paddleX && ballX < paddleX + 10&& ballY < paddleY + paddleLength)
    return true;
  else
    return false;
}