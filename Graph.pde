//EXTERIOR
//ellipse(400, 50, 10, 10);
//ellipse(615, 175, 10, 10);
//ellipse(615, 424, 10, 10);
//ellipse(400, 550, 10, 10);
//ellipse(185, 425, 10, 10);
//ellipse(185, 175, 10, 10);

class Graph {
  //Global class variables
  int x, y;
  float level;
  float randomLevel;
  float px, py;
  color col;

  //Constructor - setup variables
  Graph (int tempX, int tempY, float tempLevel, color c) {
    x = tempX;
    y = tempY;
    level = tempLevel;
    randomLevel = random(0.1, 1.);
    col = c;
  }

  void setXpos() {
  }

  void setYpos() {
  }

  void setLevel(float tempLevel) {
    float mapLevel = map(tempLevel, 0, 11., 0.1, 1.);
    level = mapLevel;
    //level = tempLevel;
  }

  float getXpos() {
    float xPosition;
    xPosition = px;
    return xPosition;
  }

  float getYpos() {
    float yPosition;
    yPosition = py;
    return yPosition;
  }

  float getLevel() {
    float pointLevel;
    pointLevel = level;
    return pointLevel;
  }

  void draw() {
    stroke(0, 180, 236, 100);
    //float progress = map(mouseX, 0, width, 0, 1);
    stroke(0, 180, 236, 50);
    //curve(width/2, height/2, width/2, height/2, x, y, x, y); 
    px = curvePoint(width/2, width/2, x, x, level);
    py = curvePoint(height/2, height/2, y, y, level);
    fill(col);
    stroke(255);
    strokeWeight(3);
    ellipse (px, py, 15, 15);
  }
}
