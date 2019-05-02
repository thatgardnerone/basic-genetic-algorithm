class Population {
  Dot[] dots;
  float fitnessSum;
  int generation;
  int bestDotIndex;
 
  Population(int size, float mutationRate) {
    dots = new Dot[size];
    
    for (int i = 0; i < size; i++) {
     dots[i] = new Dot(mutationRate); 
    }
    
    generation = 1;
    bestDotIndex = 0;
  }
  
  void show() {
   for (int i = 0; i < dots.length; i++) {
    dots[i].show(); 
   }
  }
  
  void update() {
   for (int i = 0; i < dots.length; i++) {
    dots[i].update();
   }
  }
  
  void calculateFitness() {
   for (int i = 0; i < dots.length; i++) {
    dots[i].calculateFitness(); 
   }
  }
  
  boolean allDotsDead() {
   for (int i = 0; i < dots.length; i++) {
    if (!dots[i].dead && !dots[i].reachedGoal) {
     return false; 
    }
   } 
   
   numOnTarget = 0;
   return true;
  }
  
  void naturalSelection() {
    Dot[] newDots = new Dot[dots.length];
    
    setBestDot();
    calculateFitnessSum();
    
    newDots[0] = dots[bestDotIndex].makeBaby();
    newDots[0].isBest = true;
    for (int i = 1; i < newDots.length; i++) {
      // Select parent based on fitness
      Dot parent = selectParent();     
     
     // Get babies from the parent
     newDots[i] = parent.makeBaby();
    }
    
    dots = newDots.clone();
    generation++;
  }
  
  void calculateFitnessSum() {
   fitnessSum = 0;
   
   for (int i = 0; i < dots.length; i++) {
    fitnessSum += dots[i].fitness; 
   }
  }
  
  Dot selectParent() {
    float rand = random(fitnessSum);
    float runningSum = 0;
    
    for (int i = 0; i < dots.length; i++) {
     runningSum += dots[i].fitness;
     if (runningSum > rand) {
      return dots[i]; 
     }
    }
    
    return null;
  }
  
  void mutateChildren() {
    for (int i = 0; i < dots.length; i++) {
     dots[i].brain.mutate(); 
    }
  }
  
  void setBestDot() {
   float max = 0;
   int maxIndex = 0;
   for (int i = 0; i < dots.length; i++) {
    if (dots[i].fitness > max) {
     max = dots[i].fitness; 
     maxIndex = i;
    }
   }
   peakFitness = max;
   bestDotIndex = maxIndex;
  }
}
