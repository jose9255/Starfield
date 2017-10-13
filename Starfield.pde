Particle [] aParticle = new Particle [300]; //make the jumbo particle
void setup()
{

  size (300, 300);
  background(0);

  //create particles using the array index
  for (int i = 0; i<aParticle.length; i++)
  {

    aParticle[i] = new NormalParticle();
  }

  aParticle[2] = new OddBall();
  aParticle[1] = new Jumbo();
}
void draw()
{
  //runs the show and move functions
  background(0);
  for (int i = 0; i<aParticle.length; i++)
  {
    aParticle[i].move();
    aParticle[i].show();
  }
}

class NormalParticle implements Particle
{
  float myX, myY, mySpeed, myAng;
  int myColor;
  NormalParticle()
  { //initialize in center; speed, angle, and color are random
    myX = 150;
    myY = 150;
    mySpeed = (float)(Math.random()*2+.5);
    myAng = (float)(Math.random()*4);
    myColor = (int)(Math.random()*255);
  }
  public void move() 
  { //changes the postion based on angle and speed
    myX = myX + mySpeed*(cos((float)myAng));
    myY = myY + mySpeed*(sin((float)myAng));
    //loop into the center when the particle exits the screen
    if (myX > 300 && myY > 300 || myX < 0 && myY < 0 ||myX > 300 && myY < 0 ||myX < 0 && myY > 300)
    {
      myX = 150;
      myY = 150;
      //resets angle and speed
      mySpeed = (float)(Math.random()*2+1);
      myAng = (float)(Math.random()*360);
    }
  }
  public void show()
  {
    ellipse (myX, myY, 5, 5);
  }
}

interface Particle //all particles have these function
{

  public void move();
  public void show();
}

class OddBall implements Particle //uses an interface
{
  float myX, myY, mySpeed, myAng;
  int myColor;
  OddBall()
  {
    myX = 150;
    myY = 150;
  }

  void move()
  {
    //goes from
    mySpeed = 0.5;
    myX = myX + (float)(Math.random()*5);
    myY = myY + (float)(Math.random()*5);
    if (myX > 300 && myY > 300 || myX < 0 && myY < 0 ||myX > 300 && myY < 0 ||myX < 0 && myY > 300)
    {
      myX = 150;
      myY = 150;
    }
  }
  void show()
  {
    fill ((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
    ellipse(myX, myY, 40, 25);
  }
}
class Jumbo extends NormalParticle
{
  public void show()
  {
    ellipse ( myX, myY, 50, 50);
  }
}