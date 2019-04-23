Population test;
Goal goal;

void setup() {
  size(800,800);
  test = new Population(1000);
  goal = new Goal();
}

void draw() {
  background(255);
  
  goal.show();
  
  if (test.allDotsDead()) {
   // genetic algorithm
   test.calculateFitness();
   test.naturalSelection();
   test.mutateChildren();
  }
  else {
   test.update();
   test.show();
  }
}
