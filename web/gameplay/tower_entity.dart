part of gameplay;

class TowerEntity extends Entity {
  int health;
  int armor;
  int fireRate;
  
  int projectileSpeed;
  int projectileArmorPenetration;
  Mesh projectileMesh;
  //Sound projectileSoundFire;
  //Sound projectileSoundImpact;
  //Sound projectileSoundSwoosh;
 
  bool alive = true;
  
  bool isAlive() {
    return alive;
  }
  
  void modifyHealth(int modifier) { 
    setHealth(this.health + modifier);
  }
  
  void setHealth(int health) { 
    this.health = max(0,health);
    alive = this.health > 0;
  }
  
  void setArmor(int armor) { 
    this.armor = max(0,armor);
  }
}