Population test;
Goal goal;
ArrayList<Barrier> barriers;

int numOnTarget;
float peakFitness;
int populationSize;
float mutationRate;

void setup() {
  size(800,800);
  
  populationSize = 1000;
  mutationRate = 0.01;
  
  test = new Population(populationSize, mutationRate);
  goal = new Goal();
  barriers = new ArrayList<Barrier>();
  
  
  barriers.add(new Barrier(600, 0, 200)); 
  barriers.add(new Barrier(600, width - 600, 400));
}

void draw() {
  background(255);
  text("Generation: " + test.generation, 10, 20);
  text("Population size: " + populationSize, 10, 40);
  text("Mutation rate: " + (mutationRate * 100) + "%", 10, 60);
  text("Number on target: " + numOnTarget, 10, 80);
  text("Peak fitness: " + peakFitness, 10, 100);
  
  goal.show();
  
  for (Barrier barrier : barriers) {
    barrier.show(); 
  }
  
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
