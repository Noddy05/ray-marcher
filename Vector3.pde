class Vector3 {
  float x,y,z;
  
  Vector3(){
    x = 0;
    y = 0;
    z = 0;
  }
  Vector3(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  float sqrMagnitude() {
     return x * x + y * y + z * z;
  }
  float magnitude() {
     return sqrt(sqrMagnitude());
  }
  
}

Vector3 normalized(Vector3 a){
  Vector3 out = new Vector3(a.x, a.y, a.z);
  float magnitude = a.magnitude();
  out.x = a.x / magnitude;
  out.y = a.y / magnitude;
  out.z = a.z / magnitude;
  return out;
}

Vector3 subtract(Vector3 a, Vector3 b){
  return new Vector3(a.x - b.x, a.y - b.y, a.z - b.z);
}
Vector3 add(Vector3 a, Vector3 b){
  return new Vector3(a.x + b.x, a.y + b.y, a.z + b.z);
}
Vector3 multiply(Vector3 a, float b){
  return new Vector3(a.x * b, a.y * b, a.z * b);
}
