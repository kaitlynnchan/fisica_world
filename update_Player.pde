void updatePlayer() {


  if (leftkey == false && rightkey == false || leftkey == false && upkey == false|| rightkey == false && upkey == false || rightkey == false && leftkey == false && upkey == false ) {
    currentAction = idle;
  }
  if (upkey == false) {
    currentAction = idle;
  }
  if (leftkey == false) {
    currentAction = idle;    
    dx = 0;
  }
  if (rightkey == false) {
    currentAction = idle;
    dx = 0;
  }
  if (punchkey == false) {
    currentAction = idle;
  }
  if (laserkey == false) {
    currentAction = idle;
  }

  if (leftkey == true && rightkey == true) {
    currentAction = run;
  }
  if (upkey == true && rightkey == true || upkey == true && leftkey == true || upkey == true && leftkey == true && rightkey == true) {
    currentAction = jump;
  }
  if (upkey == true && jumping == true) {
    player.setVelocity(player.getVelocityX(), -500);
    currentAction = jump;
  }
  if (leftkey == true) {
    dx -= 250; 
    currentAction = idle;
  }
  if (rightkey == true) {
    dx += 250;
    currentAction = run;
    //costumeNum = 0;
  }
  if (punchkey == true) {
    currentAction = punch;
  }
  if (laserkey == true) {
    currentAction = laser;
  }

  player.setVelocity(dx, player.getVelocityY());//dy
  if (costumeNum >= currentAction.length - 1) {
    costumeNum = 0;
  }
  player.attachImage(currentAction[costumeNum]);
  if (frameCount % 5 == 0) {
    costumeNum++;
  }

  boolean touchingWater = false;
  //contacting array
  ArrayList<FContact> contacts;
  contacts = player.getContacts();
  jumping = false;
  for (FContact c : contacts) {
    if (c.contains("lava")) {
      player.setPosition(48, 550);
    }
    if (c.contains("spring")) {
      player.setVelocity(player.getVelocityX(), -550);
    }
    if (c.contains("ground") || c.contains("mushright") || c.contains("mushleft") || c.contains("mushcenter") || c.contains("water") || c.contains("crate") || c.contains("brick") || c.contains("dirt") || c.contains("bridge") || c.contains("crystal") || c.contains("ice") || c.contains("metal")) {
      jumping = true;
    }
    if (c.contains("player", "bridge")) {
      FBody a = c.getBody1();
      FBody b = c.getBody2();
      if (a == player) {
        b.setStatic(false);
        b.setSensor(true);
      } else {
        a.setStatic(false);
        a.setSensor(true);
      }
    }
    if (c.contains("player", "brick")) {// && currentAction == punch
      FBody a = c.getBody1();
      FBody b = c.getBody2();
      if (a == player) {
        brickhp--;
        if (brickhp <= 0) {
          world.remove(b);
          brickhp = 3;
        }
      } else {
        brickhp--;
        if (brickhp <= 0) {
          world.remove(a);
          brickhp = 3;
        }
      }
    }

    if (c.contains("player", "water")) { 
      touchingWater = true;
    }

    if (c.contains("player", "coin")) {
      FBody a = c.getBody1();
      FBody b = c.getBody2();
      if (a == player) {
        coincollect += 1;
        world.remove(b);
      } else {
        world.remove(a);
      }
    }

    if (c.contains("player", "door") && upkey == true && mode == map1) {
      loadWorld("map2.png");
      mode = map2;
      //player.setPosition(48, 592);
    }
  } 

  //touchingWater
  if (touchingWater) {
    player.setDensity(20);
    println("blah");
  } else {
  }
}


void makeCharacter() {
  player = new FBox(gridSize, gridSize);
  player.setPosition(x * gridSize + gridSize/2, y * gridSize + gridSize/2);
  player.setStatic(false);
  player.setGrabbable(false);
  player.setRotatable(false);
  player.setName("player");
  world.add(player);
}
