class Goal {
  PVector location;
  int diameter = 50;
 
  Goal() {
    location = new PVector(400, 30);
  }
  
  void show() {
   fill(0, 255, 0);
   ellipse(location.x, location.y, diameter, diameter); 
  }
  
}
