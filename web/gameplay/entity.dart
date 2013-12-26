part of gameplay;

class Entity {
  
  Vector3 position;
  Quaternion rotation;
  Vector3 scale;

  Mesh model;
  
  void setPosition(Vector3 position) {
    this.position.xyz = position.xyz;
  }
  
  void setScale(Vector3 scale) {
    this.scale.xyz = scale.xyz;
  }
  
  void setRotation(Quaternion rotation) {
    this.rotation = rotation.clone();
  }
  
  void setModel(Mesh model) {
    this.model = model;
  }
}