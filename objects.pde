class Cube
{
  int randomBoxSize = 0;
  float deg = 0.0;
  int x = 0;
  int y = 0;
  int z = 0;
  int col1 = 0;
  int col2 = 0;
  int col3 = 0;
  
  // Constructor
  Cube()
  {
    x = int(random(-2000, 2000));
    y = int(random(-2000, 2000));
    z = int(random(-2000, 2000));
    col1 = int(random(0, 255));
    col2 = int(random(0, 255));
    col3 = int(random(0, 255));
    pushMatrix();
    fill(col1, col2, col3);
    randomBoxSize = int(random(10, 200));
    translate(x, y, z); 
    
    box(randomBoxSize);
    popMatrix();
  }
  
  // Rotate Cube
  // To rotate the cube properly use radians
  // Whenever a new rotation value is applied, a new box must be always drawn.
  // Source: https://processing.org/reference/radians_.html
  // Use push and pop matrix to handle transformations, Problems appear without them
  // Source: https://processing.org/reference/pushMatrix_.html
  void rotate()
  {
    pushMatrix();
    fill(col1, col2, col3);
    translate(x, y, z); 
    rotateY(radians(deg));
    box(randomBoxSize);
    popMatrix();
    
    if (deg >= 360)
    {
       deg = 0.0;
    }else{
      deg += 1.0;
    }
  }
}


class CameraMain
{
  float pos = width / 2;
  boolean movePositive = true;
  // Constructor
  CameraMain()
  {
    // camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ)
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
    //print((height/2.0) / tan(PI*30.0 / 180.0));
  }
  
  void Rotate()
  {
     
    if (pos >= 2 * width || pos <= -2 * width)
    {
      movePositive = !movePositive;
    }
    
    if (movePositive)
    {
      pos += 1.0;
    }
    else
    {
      pos -= 1.0;
    }
    
    camera(width/2.0 + pos, height/2.0, 100.0 + pos, width/2.0, height/2.0, 0, 0, 1, 0);
    //print((height/2.0) / tan(PI*30.0 / 180.0));
  }
}
