class Ship 
{
  PVector pos;
  PVector dir;
  PVector vel;

  float size;
  float maxSpeed = 20;
  float friction = 0.95;
  float speed = 0;

  PShape body; 

  boolean accelerating = false;
  boolean right = false;
  boolean left = false;

  float accelerator = 0.3;
  float turnAmt = 0.05;

  ArrayList <Bullet> chamber;

  Ship(float x, float y, float size_) 
  {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    dir = PVector.fromAngle(0);
    size = size_;

    chamber = new ArrayList<Bullet>(10);

    for (int i = 0; i < 10; i++)
    {
      chamber.add(new Bullet());
    }
  }

  void update() 
  {
    if (accelerating) 
    {
      speed += accelerator;
      speed = constrain(speed, 0, maxSpeed);
    }

    if (right) 
    {
      dir.rotate(turnAmt);
    }

    if (left)
    {
      dir.rotate(-turnAmt);
    }

    vel = PVector.mult(dir, speed);
    pos.add(vel);
    speed *= friction;

    screenWrapping();
  }

  void display() 
  {
    pushMatrix();

    translate(pos.x, pos.y);
    rotate(dir.heading( ));

    stroke(255);
    fill(0);

    beginShape();    
    vertex(size*2, 0);
    vertex(-size*1.5, size);
    vertex(-size, 0);  
    vertex(-size*1.5, -size); 
    endShape(CLOSE);

    popMatrix();
  }

  void fireBullet()
  {
    for (int i =0; i < chamber.size(); i++)
    {      
      if (chamber.get(i).fired == false)
      { 
        chamber.get(i).bulletPos = new PVector(pos.x, pos.y);
        chamber.get(i).bulletDir = new PVector(dir.x, dir.y);
        chamber.get(i).fired = true;
        break;
      }
    }
  } 

  void screenWrapping()
  {
    if (pos.x >= width)
    {
      pos.x = 1;
    }

    if (pos.x <= 0)
    {
      pos.x = width-1;
    }

    if (pos.y >= height)
    {
      pos.y = 1;
    }

    if (pos.y <= 0)
    {
      pos.y = height-1;
    }
  }
}

