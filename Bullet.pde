class Bullet
{
  PVector bulletPos;
  PVector bulletDir;
  PVector bulletVel;

  float size;
  float speed = 20;

  boolean fired = false;
  float accelerator = 0.3;

  Bullet()
  {
    bulletPos = new PVector(0, 0);    
    bulletVel = new PVector(0, 0);
    bulletDir = new PVector(0, 0);
    size = 3;
  }

  void update()
  {
    bulletVel = PVector.mult(bulletDir, speed);
    bulletPos.add(bulletVel);
    checkCollision();
  }

  void display()
  {
    ellipse(bulletPos.x, bulletPos.y, size, size);
  }

  void checkCollision()
  {
    if (bulletPos.x >= width || bulletPos.x <= 0 || bulletPos.y >= height || bulletPos.y <= 0)
    {
      fired = false;
    }
  }
}

