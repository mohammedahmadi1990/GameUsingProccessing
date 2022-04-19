/*
Compel Processing to let us edit the projection matrix.
Switch the direction of the y axis, definitively.
*/

PGraphicsOpenGL pogl = null; 

// Make sure to call at the start of your program to enable the hack
void setupPOGL() {
  pogl = (PGraphicsOpenGL)g;
}

// for debugging
void printProjection() {
  pogl.projection.print();
}

// Pre-apply a flip in the y direction to the projection matrix.
// Call this after setting the projection matrix for the view frustum.
void fixFrustumYFlip() {
  PMatrix3D proj = getProjection();
  proj.preApply(new PMatrix3D(
    1, 0, 0, 0, 
    0, -1, 0, 0, 
    0, 0, 1, 0, 
    0, 0, 0, 1
    ));
  setProjection(proj);
}

// set the internal projection matrix to the given value
void setProjection(PMatrix3D mat) {
assert pogl != null: 
  "no PGraphics Open GL Conext";
  //pogl.setProjection(mat.get());
  pogl.projection.set(mat.get());
  pogl.updateProjmodelview();
}

// get the internal projection matrix
PMatrix3D getProjection() {
assert pogl != null: 
  "no PGraphics Open GL Conext";
  return pogl.projection.get();
}
