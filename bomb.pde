class FBomb extends FBox {
  int timer;

  FBomb(float _x, float _y) {
    super(gridSize/2, gridSize/2);
    this.setPosition(_x, _y);
    this.attachImage(bombpic);
    world.add(this);
    timer = 10;
  }

  void countdown() {
    if (frameCount % 10 == 0) {
      timer--;
    }
    println(timer);
  }

  void kaboom() {
    for (FBox b : terrain) {
      if (b.getName().equals("ground") || b.getName().equals("dirt")) {
        if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 100) {
          world.remove(b);
          timer = 0;
        }
      }
      if (b.getName().equals("water")) {
        if (dist(this.getX(), this.getY(), b.getX(), b.getY()) < 100) {
          b.setStatic(false);
          b.setSensor(false);
          timer = 0;
        }
      }
    }
  }
}