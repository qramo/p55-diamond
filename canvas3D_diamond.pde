import processing.opengl.*;

void setup(){
  size(640,640,OPENGL);
  frameRate(30);
}

float cc=0.7;
float Hcolor=0;
float lightLevel=100;

//Round setting
float roundSize=300;

float tableR=roundSize*0.55*cc;
float girdleR=roundSize*cc;
float culetR=roundSize*0.02*cc;
float crownMidR=(tableR+girdleR)/2;
float crownMidRTop=crownMidR/cos(radians(22.5));
float pavilionMidR=(girdleR+culetR)/2;
float pavilionMidRTop=pavilionMidR/cos(radians(22.5));

//Height setting
float looseDepth=roundSize*0.6;
float culetZ=roundSize*0.43*cc;
float tableZ=0-(looseDepth-culetZ)*cc;
float girdleZ=0*cc;
float crownMidZ=(girdleZ-tableZ)/(girdleR-tableR)*crownMidR-(girdleZ-tableZ)/(girdleR-tableR)*girdleR;
float pavilionMidZ=(girdleZ-culetZ)/(girdleR-culetR)*pavilionMidR-(girdleZ-culetZ)/(girdleR-culetR)*girdleR;

float rX;
float rY;
float rZ;

void draw(){
  colorMode(HSB,100);
  background(0);
  translate(width/2,height/2,0);

  rX=rX+0.0002;
  rY=rY+0.0007;
  rZ=rZ+0.05;

  pointLight(Hcolor, 100, 100, 0,-300,200);
  directionalLight(Hcolor,30, lightLevel, 0,-200, -100);

  rotateX(rX);
  rotateY(rY);
  rotateZ(rZ);

  //noFill(); 
  fill(0,0,100,60);
  stroke(Hcolor,100,70,45);
  strokeWeight(1);

  for(float rad=0;rad<=360;rad=rad+360/8){

    float girdleRadA=rad+22.5;
    float girdleRadA2=rad-22.5;
    float girdleRadB=rad;
    float pavilionMidRad=rad;
    float pavilionMidRad2=rad+45;
    float culetRad=rad;
    float culetRad2=rad+45;
    float crownMidRad=rad;
    float crownMidRad2=rad+45;
    float tableRad=rad+22.5;
    float tableRad2=rad-22.5;

    //draw lower girdle Facet

    beginShape();
    vertex(girdleR*cos(radians(girdleRadA)),girdleR*sin(radians(girdleRadA)),girdleZ);
    vertex(girdleR*cos(radians(girdleRadB)),girdleR*sin(radians(girdleRadB)),girdleZ);
    vertex(pavilionMidRTop*cos(radians(pavilionMidRad)),pavilionMidRTop*sin(radians(pavilionMidRad)),pavilionMidZ);
    endShape();
    beginShape();
    vertex(girdleR*cos(radians(girdleRadA2)),girdleR*sin(radians(girdleRadA2)),girdleZ);
    vertex(girdleR*cos(radians(girdleRadB)),girdleR*sin(radians(girdleRadB)),girdleZ);
    vertex(pavilionMidRTop*cos(radians(pavilionMidRad)),pavilionMidRTop*sin(radians(pavilionMidRad)),pavilionMidZ);
    endShape();

    //draw pavilion facet

    beginShape();
    vertex(culetR*cos(radians(culetRad)),culetR*sin(radians(culetRad)),culetZ);
    vertex(pavilionMidRTop*cos(radians(pavilionMidRad)),pavilionMidRTop*sin(radians(pavilionMidRad)),pavilionMidZ);
    vertex(girdleR*cos(radians(girdleRadA)),girdleR*sin(radians(girdleRadA)),girdleZ);
    vertex(pavilionMidRTop*cos(radians(pavilionMidRad2)),pavilionMidRTop*sin(radians(pavilionMidRad2)),pavilionMidZ);
    vertex(culetR*cos(radians(culetRad2)),culetR*sin(radians(culetRad2)),culetZ);
    endShape();

    //draw star facet

    beginShape();
    vertex(tableR*cos(radians(tableRad)),tableR*sin(radians(tableRad)),tableZ);
    vertex(crownMidRTop*cos(radians(crownMidRad)),crownMidRTop*sin(radians(crownMidRad)),crownMidZ);
    vertex(tableR*cos(radians(tableRad2)),tableR*sin(radians(tableRad2)),tableZ);
    endShape();

    //draw bezel facet

    beginShape();
    vertex(crownMidRTop*cos(radians(crownMidRad)),crownMidRTop*sin(radians(crownMidRad)),crownMidZ);
    vertex(girdleR*cos(radians(girdleRadA)),girdleR*sin(radians(girdleRadA)),girdleZ);
    vertex(crownMidRTop*cos(radians(crownMidRad2)),crownMidRTop*sin(radians(crownMidRad2)),crownMidZ);
    vertex(tableR*cos(radians(tableRad)),tableR*sin(radians(tableRad)),tableZ);
    endShape();

    //draw upper girdle Facet

    beginShape();
    vertex(girdleR*cos(radians(girdleRadA)),girdleR*sin(radians(girdleRadA)),girdleZ);
    vertex(girdleR*cos(radians(girdleRadB)),girdleR*sin(radians(girdleRadB)),girdleZ);
    vertex(crownMidRTop*cos(radians(crownMidRad)),crownMidRTop*sin(radians(crownMidRad)),crownMidZ);
    endShape();
    beginShape();
    vertex(girdleR*cos(radians(girdleRadA2)),girdleR*sin(radians(girdleRadA2)),girdleZ);
    vertex(girdleR*cos(radians(girdleRadB)),girdleR*sin(radians(girdleRadB)),girdleZ);
    vertex(crownMidRTop*cos(radians(crownMidRad)),crownMidRTop*sin(radians(crownMidRad)),crownMidZ);
    endShape();
  }

  //draw culet

  beginShape();
  for(float rad=0;rad<=360;rad=rad+360/8){
    float culetRad=rad;
    vertex(culetR*cos(radians(culetRad)),culetR*sin(radians(culetRad)),culetZ);
  }
  endShape();

  //draw table

    beginShape();
  for(float rad=0;rad<=360;rad=rad+360/8){
    float tableRad=rad+22.5;
    vertex(tableR*cos(radians(tableRad)),tableR*sin(radians(tableRad)),tableZ);
  }
  endShape();
  
  lightLevel=lightLevel/1.2;
  //pointLight(Hcolor, 100, 100, 0, 0,-20);

}

void mouseClicked() {
  Hcolor=norm(mouseX, 0, width)*100;
  cc=norm((height-mouseY), 0, height);
  println(mouseX+":"+Hcolor);
//Round setting

tableR=roundSize*0.55*cc;
girdleR=roundSize*cc;
culetR=roundSize*0.02*cc;
crownMidR=(tableR+girdleR)/2;
crownMidRTop=crownMidR/cos(radians(22.5));
pavilionMidR=(girdleR+culetR)/2;
pavilionMidRTop=pavilionMidR/cos(radians(22.5));

//Height setting
looseDepth=roundSize*0.6;
culetZ=roundSize*0.43*cc;
tableZ=0-(looseDepth-culetZ)*cc;
girdleZ=0*cc;
crownMidZ=(girdleZ-tableZ)/(girdleR-tableR)*crownMidR-(girdleZ-tableZ)/(girdleR-tableR)*girdleR;
pavilionMidZ=(girdleZ-culetZ)/(girdleR-culetR)*pavilionMidR-(girdleZ-culetZ)/(girdleR-culetR)*girdleR;



}

float moveR=0.1;
void keyTyped() {
  
  lightLevel=100;

  if (key == '1') {
    rX=rX+moveR;
  }
  if (key == '2') {
    rY=rY+moveR;
  }
  if (key == '3') {
    rZ=rZ+moveR;
  }
}


void drawMatrix(){
  stroke(255);
  translate(width/2,height/2,0);
  line(-width/2,0,width/2,0);
  line(0,-height/2,0,height/2);
  line(0,0,-width/2,0,0,width/2);
}
