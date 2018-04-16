class Goomba extends FBox {

  int direction, speed;

  Goomba() {
    super(gridSize, gridSize);
    this.setFillColor(pink);
    this.attachImage(goomba);
    this.setStaticBody(false);
    this.setGrabbable(false);
    this.setFriction(0);
    this.setName("goomba");
    direction = 1;
    speed = 50;
  }

  void act() {
    
    this.setVelocity(speed * direction, this.getVelocityY());
    if (touching("brick") || touching("goomba") || touching("crate")) {
      direction *= -1;
      this.setPosition(getX() + direction, getY());
    }
    if(touching("player") && player.getX() >= this.getX() - gridSize/2 && player.getX() <= this.getX() + gridSize/2){
      world.remove(this);
    }
    if(touching("player") && player.getY() >= this.getY() - gridSize/2 && player.getY() <= this.getY() + gridSize/2){
      player.setPosition(48, 550);
    }
  }

  boolean touching(String thing) {
    ArrayList<FContact> contacts = this.getContacts();

    for (FContact c : contacts) {
      if (c.contains("goomba", thing)) {
        return true;
      }
    }
    return false;
  }
}