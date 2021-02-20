PImage bg;
PGraphics pg;

Graph[] graph = new Graph[6];

float countAll = 0.;
float[] counts = new float[6];
float[] countNum = new float[6];
float countMax = Float.MIN_VALUE;
float countMin = Float.MAX_VALUE;
int initClick = 0;

PFont font;

void setup() {
  size(800, 600);
  frameRate(20);
  smooth(4);
  font = loadFont("ArialRoundedMTBold-48.vlw");
  pg = createGraphics(width, height);
  bg = loadImage("background.png");
  bg.resize(width, height);
  
  //Initialize custome values for each array object
  graph[0] = new Graph (400, 50, 0, #FF0000);
  graph[1] = new Graph (615, 175, 0, #FF358B);
  graph[2] = new Graph (615, 425, 0, #AEEE00);
  graph[3] = new Graph (400, 550, 0, #01B0F0);
  graph[4] = new Graph (185, 425, 0, #375D81);
  graph[5] = new Graph (185, 175, 0, #413659);
 
  //Initialize values for counter
  for (int i=0; i<counts.length; i++) {
    counts[i] = 0;
  }
}

void draw() {
  //background(20);
  image(bg, 0, 0);

  if (initClick<=0)initialMessage();
  drawGraph();  
  displayText();
}

int playerAffect = 0;

void getData(int randVal) {
  countMax = max(counts);
  countMin = min(counts);
  for (int i=0; i<counts.length; i++) {
    countNum[i] = (counts[i]/countMax) * 10;
    if (randVal == i) counts[i] = counts[i] + 1;
  }
}

void drawGraph(){
  strokeWeight(0.5);
  stroke(255, 150);
  noFill();
  smooth(8);
  arc(width/2, height/2, 500, 500, radians(240), radians(300), PIE);
  arc(width/2, height/2, 500, 500, radians(300), radians(360), PIE);
  arc(width/2, height/2, 500, 500, radians(0), radians(60), PIE);
  arc(width/2, height/2, 500, 500, radians(60), radians(120), PIE);
  arc(width/2, height/2, 500, 500, radians(120), radians(180), PIE);
  arc(width/2, height/2, 500, 500, radians(180), radians(240), PIE);

  strokeWeight(1.5);
  noFill();
  stroke(255, 150);
  ellipse(width/2, height/2, 100, 100);
  ellipse(width/2, height/2, 200, 200);
  ellipse(width/2, height/2, 300, 300);
  ellipse(width/2, height/2, 400, 400);
  ellipse(width/2, height/2, 500, 500);

  fill (255, 50);
  beginShape();
  for (int i=0; i<counts.length; i++) {
    vertex(graph[i].getXpos(), graph[i].getYpos());  
  }
  endShape(CLOSE);

  for (int i=0; i<counts.length; i++) {
    graph[i].draw();
    graph[i].setLevel(countNum[i]);
  }
}

void displayText() {
  textFont(font);
  textSize(18);
  noStroke();

  fill(255, 100);
  rect(width/2-100, 6, 200, 35);
  fill(0, 140);
  text("Label A: " + (int) counts[0], 345, 30);

  fill(255, 100);
  rect(620, 140, 200, 35);
  fill(0, 140);
  text("Label B: " + (int) counts[1], 660, 165);

  fill(255, 100);
  rect(620, height-176, 200, 35);
  fill(0, 140);
  text("Label C: " + (int) counts[2], 660, height-152);

  fill(255, 100);
  rect(width/2-125, height-40, 250, 35);
  fill(0, 140);
  text("Label D: " + (int) counts[3], 350, height-15);
  
  fill(255, 100);
  rect(-19, height-176, 200, 35);
  fill(0, 140);
  text("Label E: " + (int) counts[4], 30, height-152);

  fill(255, 100);
  rect(-19, 140, 200, 35);
  fill(0, 140);
  text("Label F: " + (int) counts[5], 30, 165);
  
  //println(mouseX + " " + mouseY);
}

void initialMessage(){
  fill(255, 140);
  textSize(12);
  text("Click the mouse to start random counting", 10, 20);
}

void mouseClicked(){
  initClick++;
  int randomVal = (int)random(6);
  getData(randomVal);
}
