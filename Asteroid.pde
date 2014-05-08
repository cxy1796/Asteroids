class Asteroid
{  
  PVector astPos;
  PVector astDir;
  PVector astVel;

  PShape shape;
  float sides;
  float speed = 5;
  float Noise = 200;

  float[] xPoints;
  float[] yPoints;

  Asteroid(float x, float y, float sides_)
  {
    astPos = new PVector(200, 200); 
    sides = sides_;
    astDir = new PVector(5, 0);

    xPoints = new float[(int)sides];
    yPoints = new float[(int)sides];

    for (int i = 0; i < sides; i++)
    {
      Noise += 800;
      
      xPoints[i] = noise(Noise)*200;
      yPoints[i] = noise(Noise)*400;
      println(xPoints[i]+ " " +yPoints[i]);
    }
  }

  void update()
  {
    astVel = PVector.mult(astDir, speed);
    astPos.add(astVel);
  }

  void display()
  {
    pushMatrix();

    translate(astPos.x, astPos.y);
    rotate(astDir.heading( ));

    stroke(255);
    fill(0);
    beginShape();
    for (int i=0; i < sides; i++) 
    {
      vertex(xPoints[i], yPoints[i]);
    }
    endShape(CLOSE);

    popMatrix();
  }

  void screenWrapping()
  {
    if (astPos.x >= width)
    {
      astPos.x = 1;
    }

    if (astPos.x <= 0)
    {
      astPos.x = width-1;
    }

    if (astPos.y >= height)
    {
      astPos.y = 1;
    }

    if (astPos.y <= 0)
    {
      astPos.y = height-1;
    }
  }
}

