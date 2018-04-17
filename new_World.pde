import fisica.*;

//fisica
FWorld world;

int x, y;

final int map1 = 1;
final int map2 = 2;
int mode = map1;

//colors
color black = color(0, 0, 0);
color white = color(255, 255, 255);
color darkbrown = color(102, 51, 0);
color pale = color(239, 228, 176);
color green = color(34, 177, 76);
color red = color(237, 28, 36);
color lightred = color(255, 13, 19);
color blue = color(184, 217, 200);
color darkpale = color(226, 206, 114);
color burgandy = color(136, 0, 21);
color lightblue = color(153, 217, 234);
color aqua = color(0, 162, 232);
color mustard = color(255, 201, 14);
color pink = color(255, 174, 201);
color silver = color(195, 195, 195);
color yellow = color(255, 242, 0);
color lightgreen = color(181, 230, 29);
color lavender = color(200, 191, 231);
color glassblue = color(211, 245, 242);

int gridSize = 32;
PImage map;
PImage dirtTop, dirtCenter, lava, sprite, brick, bridge, mushroomcenter, mushroomleft, mushroomright, mushroomstick, water, goomba, metal, teleporter, bombpic, explosion, crystal;
PImage ice;
PFont font;

ArrayList<FBox> terrain;
ArrayList<FBox> enemies;

boolean w, a, s, d, upkey, leftkey, rightkey, downkey, punchkey, laserkey;
int keyholding = 3;

float dx;
float dx2, dy2;
FBox player;
ArrayList<FBomb> bomb;

PImage[] runleft;
PImage[] run;
PImage[] idle;
PImage[] jump;
PImage[] punch;
PImage[] laser;
PImage[] currentAction;
PImage[] waterpics = new PImage[4];
int costumeNumWater = 0;
PImage[] lavapics = new PImage[6];
int costumeNumLava = 0;
PImage[] coinpics = new PImage[4];
int costumeNumCoin = 0;
int costumeNum = 0;
int frame = 0;
int brickhp = 3;
int coincollect = 0;
int teleporting = 2;

boolean jumping = false;

void setup() {
  size(600, 600, FX2D);
  Fisica.init(this);
  
  dirtTop = loadImage("dirt_n.png");
  dirtCenter = loadImage("dirt_center.png");
  lava = loadImage("lava0.png");
  sprite = loadImage("megaman0.png");
  brick = loadImage("brick.png");
  bridge = loadImage("bridge_center.png");
  mushroomcenter= loadImage("mushroom_center.png");
  mushroomleft = loadImage("mushroom_left.png");
  mushroomright = loadImage("mushroom_right.png");
  mushroomstick = loadImage("mushroom_stick.png");
  water = loadImage("water0.png");
  metal = loadImage("slice84_84.png");
  goomba = loadImage("goomba4.png");
  goomba.resize(32, 32);
  teleporter = loadImage("teleporter.png");
  teleporter.resize(32, 32);
  bombpic = loadImage("bomb.png");
  bombpic.resize(gridSize/2 + 2, gridSize/2 + 2);
  explosion = loadImage("explosion.png");
  explosion.resize(100, 100);
  crystal = loadImage("crystal.png");
  crystal.resize(32, 32);
  ice = loadImage("ice0.png");

  waterpics[0] = loadImage("water1.png");
  waterpics[1] = loadImage("water2.png");
  waterpics[2] = loadImage("water3.png");
  waterpics[3] = loadImage("water4.png");


  lavapics[0] = loadImage("lava0.png");
  lavapics[1] = loadImage("lava1.png");
  lavapics[2] = loadImage("lava2.png");
  lavapics[3] = loadImage("lava3.png");
  lavapics[4] = loadImage("lava4.png");
  lavapics[5] = loadImage("lava5.png");

  coinpics[0] = loadImage("coin0.png");
  coinpics[1] = loadImage("coin1.png");
  coinpics[2] = loadImage("coin2.png");
  coinpics[3] = loadImage("coin3.png");

  font = createFont("Mario-Kart-DS.ttf", 20);

  //runleft = new PImage[5];
  runleft = new PImage[3];
  run = new PImage[3];
  idle = new PImage[1];
  jump = new PImage[4];
  punch = new PImage[4];
  laser = new PImage[4];

  run[0] = loadImage("megaman3.png");
  run[1] = loadImage("megaman4.png");
  run[2] = loadImage("megaman5.png");
  //run[0].resize(gridSize, gridSize);

  //runleft[0] = getReversePImage(run[0]);
  //runleft[1] = getReversePImage(run[1]);
  //runleft[2] = getReversePImage(run[2]);

  idle[0] = loadImage("megaman0.png");

  jump[0] = loadImage("megaman7.png");
  jump[1] = loadImage("megaman6.png");
  jump[2] = loadImage("megaman7.png");
  jump[3] = loadImage("megaman8.png");

  punch[0] = loadImage("megaman23.png");
  punch[1] = loadImage("megaman24.png");
  punch[2] = loadImage("megaman25.png");
  punch[3] = loadImage("megaman26.png");

  laser[0] = loadImage("megaman9.png");
  laser[1] = loadImage("megaman10.png");
  laser[2] = loadImage("megaman11.png");
  laser[3] = loadImage("megaman12.png");

  currentAction = idle;

  loadWorld("map.png");
}

void draw() {
  background(blue);
  //println(player.getX(), player.getY());//player.getX(), player.getY()

  int n = bomb.size();
  int i = 0;
  while (i < n) {
    println("testing");
    FBomb p = bomb.get(i);
    p.countdown();
    if (p.timer == 1) p.attachImage(explosion);
    if (p.timer == 0) {
      p.kaboom();
      //p.timer = 0;
      world.remove(p);
    }
    i++;
  }
  
  pushMatrix();
  translate(-player.getX() + width/2, -player.getY() + height/2);
  world.step();
  world.draw();
  popMatrix();

  updateTerrain();
  updateEnemies();
  updatePlayer();
  
  image(coinpics[frame], 60, 50);
  textSize(30);
  fill(white);
  text(coincollect, 30, 80);
  if (frameCount % 20 == 0) {
    frame++;
    if (frame == 3) frame = 0;
  }
}


void keyPressed() {
  if (key == 'w' || key == 'W') w = true;
  if (key == 'a' || key == 'A') a = true;
  if (key == 's' || key == 'S') s = true;
  if (key == 'd' || key == 'D') d = true;
  if (key == 'p' || key == 'P') punchkey = true;
  if (key == 'l' || key == 'L') laserkey = true;
  if (keyCode == UP && jumping == true) upkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == DOWN) downkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ') bomb.add(new FBomb(player.getX(), player.getY()));
}


void keyReleased() {
  if (key == 'w' || key == 'W') w = false;
  if (key == 'a' || key == 'A') a = false;
  if (key == 's' || key == 'S') s = false;
  if (key == 'd' || key == 'D') d = false;
  if (key == 'p' || key == 'P') punchkey = false;
  if (key == 'l' || key == 'L') laserkey = false;
  if (keyCode == UP) upkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == DOWN) downkey = false;
  if (keyCode == RIGHT) rightkey = false;
}
