void updateEnemies() {
  
  for (FBox enemy : enemies) {

    if (enemy.getName().equals("goomba")) {
      ((Goomba) enemy).act();
    }
  }
}