class Goal {
  PVector location;
 
  Goal() {
    location = new PVector(400, 10);
  }
  
  void show() {
   fill(0, 255, 0);
   ellipse(location.x, location.y, 10, 10); 
  }
  
}
