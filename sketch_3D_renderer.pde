float scaleFactor = 5;


int steps = 30;
Vector3 cameraPosition = new Vector3();

ArrayList<Sphere>spheres = new ArrayList<Sphere>();

void setup(){
  size(800, 800);
  spheres.add(new Sphere(new Vector3(0, 0, 5), 2, color(255, 255, 0)));
  spheres.add(new Sphere(new Vector3(2, 2, 5), 1, color(255, 0, 0)));
}

float k = 1;
void draw(){
  background(30);
  k = 1 + abs(sin(frameCount / 50.0));
  
  for(int y = 0; y < height / scaleFactor; y++){
    for(int x = 0; x < width / scaleFactor; x++){
      Vector3 direction = normalized(new Vector3(((float)x) / (width / scaleFactor) * 2 - 1, -(((float)y) / (height / scaleFactor) * 2 - 1), 1));
      
      Vector3 position = new Vector3();
      
      for(int i = 0; i < steps; i++){
        float minDistance = 200000;
        for(Sphere sphere : spheres){
          float distance = DistanceEstimator(position, sphere.p, 1);
          minDistance = smoothMin(distance, minDistance, k);
        }
        position = add(position, multiply(direction, minDistance));
        if(minDistance < 0.1)
        {
          fill(255, 255, 255);
          noStroke();
          color c = color(255, 255, 0);
          fill(c);
          rect(x * scaleFactor, y * scaleFactor, scaleFactor, scaleFactor);
        }
      }
    }
  }
}

float smoothMin(float a, float b, float k){
  return - smoothMax(-a, -b, k);
}

float smoothMax(float a, float b, float k){
  return log(exp(k * a) + exp(k * b)) / k;
}

float DistanceEstimator(Vector3 position, Vector3 sphere, float radius){
  
  
  return subtract(position, sphere).magnitude() - radius;
}
