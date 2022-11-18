class Sphere{
  Vector3 p;
  float r;
  color c;
  
  Sphere (Vector3 p, float r, color c){
    this.p = p;
    this.r = r;
    this.c = c;
  }
  
  void move(Vector3 movement){
    add(p, movement);
  }
}
