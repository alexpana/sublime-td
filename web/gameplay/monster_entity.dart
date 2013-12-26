part of gameplay;

class MonsterEntity extends Entity {
  int health;
  int speed;
  int armor;
  
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
  
  void setSpeed(int speed) { 
    this.speed = max(0,speed);
  }
  
  void setArmor(int armor) { 
    this.armor = max(0,armor);
  }
}