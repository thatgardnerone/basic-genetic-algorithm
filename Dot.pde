class Dot {
 PVector pos;
 PVector vel;
 PVector acc;
 
 Brain brain;
 boolean dead = false;
 boolean reachedGoal = false;
 boolean isBest = false;
 
 float fitness = 0;
 
 Dot(float mutationRate) {
  brain = new Brain(400, mutationRate);
   
  pos = new PVector(width/2, height - 2);
  vel = new PVector(0,0);
  acc = new PVector(0,0);
 }
 
 void show() {
   if (isBest) {
    fill(100,180,255);
    ellipse(pos.x, pos.y, 8, 8);
   }
   
   fill(0);
   ellipse(pos.x, pos.y, 4, 4);
 }
 
 void move() {
   if (brain.directions.length > brain.step) {
     acc = brain.directions[brain.step];
     brain.step++;
   }
   else {
     dead = true;
   }
   
   vel.add(acc);
   vel.limit(5);
   
   pos.add(vel);
 }
   
  void update() {
    boolean isSearching = !dead && !reachedGoal;
    boolean isAtWall = pos.x < 2 || pos.y < 2 || pos.x > width - 2 || pos.y > height - 2;
    boolean isAtGoal = dist(pos.x, pos.y, goal.location.x, goal.location.y) < goal.diameter / 2;
    boolean isAtBarrier = checkForBarrierCollision();
    
    if (isSearching) {
     move();
       
     if (isAtWall) {
      dead = true; 
     }
     else if (isAtGoal) {
      reachedGoal = true;
      numOnTarget++;
     }
     else if (isAtBarrier) {
       dead = true;
     }
    }
  }
  
  boolean checkForBarrierCollision() {
    for (Barrier barrier : barriers) {
      // Remember that the y-axis increases going down
      boolean isGLeft   = pos.x > barrier.x - 2;
      boolean isLRight  = pos.x < barrier.x + barrier.w + 2;
      boolean isGBottom = pos.y < barrier.y + barrier.h + 2;
      boolean isLTop    = pos.y > barrier.y - 2;
      
      boolean isTouchingWall = isGLeft && isLRight && isGBottom && isLTop;
      if (isTouchingWall) {
        return true; 
      }
    }
    return false;
  }
  
  void calculateFitness() {
    if (reachedGoal) {
     fitness = 1.0/(float)(brain.step * brain.step);
    }
    else {
     float distToGoal = dist(pos.x, pos.y, goal.location.x, goal.location.y);
     fitness = 1.0/(distToGoal * distToGoal);
    }
  }
  
  Dot makeBaby() {
   Dot baby = new Dot(mutationRate);
   baby.brain = brain.clone();
   return baby;
  }
}
