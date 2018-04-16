void loadWorld(String mapname) {

  world = new FWorld(0, 0, 10000, 10000);//-1000, -1000, 10000, 10000
  world.setGravity(0, 980);

  terrain = new ArrayList<FBox>();
  enemies = new ArrayList<FBox>();
  bomb = new ArrayList<FBomb>();

  map = loadImage(mapname);

  x = 0;
  y = 0;

  while (y < map.height) {
    color c = map.get(x, y);

    if (c == mustard) makeCharacter();
    if (c == green) makeGrass();
    if (c == pale) makeDirt();
    if (c == red) makeLava();
    if (c == darkbrown) makeBridge();
    if (c == lightred && map.get(x - 1, y) != white && map.get(x + 1, y) != white) makeMushroomCenter();
    if (c == lightred && map.get(x - 1, y) == white) makeMushroomLeft();
    if (c == lightred && map.get(x + 1, y) == white) makeMushroomRight();
    if (c == darkpale) makeMushroomStick();
    if (c == burgandy) makeBrick();
    if (c == aqua) makeWater();
    if (c == lightblue) makeWaterSurface();
    if (c == silver) makeMetal();
    if (c == yellow) makeCoin();
    if (c == lightgreen) makeDoor1();
    if (c == lavender) makeCrystal();
    if(c == glassblue) makeIce();
    if (c == pink) {
      Goomba g = new Goomba();
      g.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
      world.add(g);
      enemies.add(g);
    }

    x++;
    if (x > map.width) {
      y++;
      x = 0;
    }
  }
}