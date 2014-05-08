Ship spaceShip;
Asteroid thing;

void setup()
{
  size(800, 600);

  spaceShip = new Ship(400, 300, 5);
  thing = new Asteroid(200, 300, 8);
}

void draw()
{
  background(0);
  spaceShip.update();
  spaceShip.display();
  
    for (int i = 0; i < spaceShip.chamber.size(); i++)
    {
      if(spaceShip.chamber.get(i).fired == true)
      {
        spaceShip.chamber.get(i).update();
        spaceShip.chamber.get(i).display();
      }
    }
    
    //thing.update();
    //thing.display();
}

void keyReleased() 
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      spaceShip.accelerating = false;
    }
    else if (keyCode == RIGHT) 
    {
      spaceShip.right = false;
    }
    else if (keyCode == LEFT) 
    {
      spaceShip.left = false;
    }
  }
  else
  {
    if(key == ' ')
    {
      spaceShip.fireBullet();
    }
  }
} 

void keyPressed() 
{
  if (key == CODED) 
  {
    if (keyCode == UP) 
    {
      spaceShip.accelerating = true;
    }
    else if (keyCode == RIGHT) 
    {
      spaceShip.right = true;
    }
    else if (keyCode == LEFT) 
    {
      spaceShip.left = true;
    }
  }
  
}


