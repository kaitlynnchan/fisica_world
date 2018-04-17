void updateTerrain() {

  if (frameCount % 5 == 0) {
    costumeNumWater++;
    if (costumeNumWater >= waterpics.length) {
      costumeNumWater = 0;
    }
  }
  if (frameCount % 10 == 0) {
    costumeNumLava++;
    if (costumeNumLava >= lavapics.length) {
      costumeNumLava = 0;
    }
  }
  if (frameCount % 10 == 0) {
    costumeNumCoin++;
    if (costumeNumCoin >= coinpics.length) {
      costumeNumCoin = 0;
    }
  }

  int i = 0;
  while (i < terrain.size()) {
    FBox b = terrain.get(i);

    if (b.getName().equals("water surface")) {
      b.attachImage(waterpics[costumeNumWater]);
    }
    if (b.getName().equals("lava")) {
      b.attachImage(lavapics[costumeNumLava]);
    }
    if (b.getName().equals("coin")) {
      b.attachImage(coinpics[costumeNumCoin]);
    }
    if (b.getName().equals("brick") && brickhp <= 0) {
      world.remove(b);
    }
    
    i++;
  }
}


void makeGrass() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(dirtTop);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("ground");
  world.add(b);
  terrain.add(b);
}
void makeDirt() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(dirtCenter);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("dirt");
  world.add(b);
  terrain.add(b);
}
void makeMushroomCenter() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(mushroomcenter);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("mushcenter");
  world.add(b);
}
void makeMushroomLeft() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(mushroomleft);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("mushleft");
  world.add(b);
}
void makeMushroomRight() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(mushroomright);
  b.setStatic(true);
  b.setGrabbable(false);
  world.add(b);
  b.setName("mushright");
}
void makeMushroomStick() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(mushroomstick);
  b.setStatic(true);
  b.setGrabbable(false);
  world.add(b);
}
void makeLava() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(lavapics[0]);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("lava");
  world.add(b);
  terrain.add(b);
}
void makeBrick() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2); 
  b.attachImage(brick);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("brick");
  world.add(b);
  terrain.add(b);
}
void makeBridge() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(bridge);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("bridge");
  world.add(b);
  terrain.add(b);
}
void makeWater() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(water);
  b.setImageAlpha(100);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setSensor(true);
  b.setName("water");
  terrain.add(b);
  world.add(b);
}
void makeWaterSurface() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(waterpics[0]);
  b.setImageAlpha(100);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setSensor(true);
  b.setName("water surface");
  world.add(b);
  terrain.add(b);
}
void makeCoin() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(coinpics[0]);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setSensor(true);
  b.setName("coin");
  world.add(b);
  terrain.add(b);
}
void makeMetal() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(metal);
  b.setFillColor(silver);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("metal");
  world.add(b);
}
void makeTeleporter() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(mouseX * gridSize + gridSize/2, mouseY * gridSize + gridSize/2);
  b.attachImage(teleporter);
  b.setFillColor(silver);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("teleporter");
  world.add(b);
  //println(b.getX(), b.getY());
}
void makeDoor1() {
  FBox b = new FBox(gridSize, gridSize * 2);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  //b.attachImage();
  b.setFillColor(lightgreen);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("door");
  world.add(b);
}
void makeCrystal() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(crystal);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("crystal");
  world.add(b);
}
void makeIce() {
  FBox b = new FBox(gridSize, gridSize);
  b.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  b.attachImage(ice);
  b.setStatic(true);
  b.setGrabbable(false);
  b.setName("ice");
  world.add(b);
}
