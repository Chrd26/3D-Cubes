//Cube cube;
ArrayList<Cube> cubes = new ArrayList<Cube>();
int timer = 0;
int light = 255;
boolean increaseLightVolume = false;
CameraMain cameraMain;

void setup()
{
  size(800, 600, P3D);
  cameraMain = new CameraMain();
  directionalLight(255, 255, 255, -1, 0, 0.5);
}

void draw()
{
  background(0);
  
  directionalLight(light, light, light, -1, 0, 0.5);
  
  if (!increaseLightVolume)
  {
    light -= 1;
  }else{
    light += 1;
  }
  
  
  if ( light <= 100 || light >= 255)
  {
    increaseLightVolume = !increaseLightVolume;
  }
  
  // Rotate Camera Around
  cameraMain.Rotate();
  
  timer += 1;
  int cubeCounter = 0;

  // Whenever the time reach 100 and the cube limit has not been reached
  if (timer >= 100)
  { 
    int randomNum = int(random(0, 10));
    // Add every single instantiation of cubes to the 
    // cubes array list one by one
    for (int i = 0; i < randomNum; i++)
    {
      cubes.add(CreateCube());
    }
    timer = 0;
  }
  
  // Itirate through the cubes array list
  for (Cube item : cubes)
  {
    item.rotate();
    cubeCounter += 1;
    
  }
  
  // Set cubesLimit to true
  if (cubeCounter >= 300)
  {
    cubes.clear();
  }
  
}
