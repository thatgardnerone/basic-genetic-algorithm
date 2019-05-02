class Barrier {
  int x, y;
  int w, h;
  
  Barrier(int w, int x, int y) {
    this.w = w;
    this.h = 10;
    this.x = x;
    this.y = y;
  }
  
  void show() {
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
}
