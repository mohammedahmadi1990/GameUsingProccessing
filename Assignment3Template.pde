PShape tiles;
int scale = 20;

void setup() {
  size(640, 640, P3D);
  tiles = createShape(GROUP);
//  //colorMode(RGB, 1.0f);
//  //textureMode(NORMAL); // uses normalized 0..1 texture coords
//  //textureWrap(REPEAT);
  
//  //setupPOGL(); // behind-the-scenes setup to give us access to the projection matrix
//  //setupProjections();
//  ////resetMatrix(); // do this here and not in draw() so that you don't reset the camera

  for (int y=0; y<height/scale; y++) {
    for (int x=0; x<width/scale; x++) {
      PShape tile = createShape(RECT, x * scale, y * scale, scale, scale);
      //float noiseValue = noise(x * 0.05, y * 0.05);
      //tile.setFill(color(noiseValue * 255));
      tile.setFill(color(random(255), random(255), random(255)));
      tile.setStroke(false);
      tiles.addChild(tile);
    }
  }
}

void draw() {
  shape(tiles);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  println(e);
}
