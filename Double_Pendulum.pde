float r1 = 200;
float r2 = 200;
float m1 = 30;
float m2 = 30;
float a1 = PI/2;
float a2 = PI/2;
float g = 1;
float velo1 = 0;
float velo2 = 0;
float acc1 = 0;
float acc2 = 0;

float x3 = -1;
float y3 = -1;

PGraphics c;

void setup()
{
  size(1200,800);
  c= createGraphics(1200,800);
  c.beginDraw();
  c.background(255);
  c.endDraw();
}

void draw()
{
  float n1 = -g * (2*m1+m2) * sin(a1);
  float n2 = -m2 * g * sin(a1-2*a2);
  float n3 = -2 * sin(a1-a2) * m2;
  float n4 = velo2* velo2 * r2 + velo1 * velo1 * r1 * cos(a1-a2);
  float denominator1 = r1 * (2*m1+m2-m2*cos(2*a1-2*a2));
  acc1 = (n1 + n2 + n3 * n4)/denominator1;


  float denominator2 = r2 * (2*m1+m2-m2*cos(2*a1-2*a2));
  float n5 = 2*sin(a1-a2);
  float n6 = (velo1 * velo1 * r1* (m1+m2));
  float n7 = g* (m1+m2) * cos(a1);
  float n8 = velo2*velo2*r2*m2*cos(a1-a2);

  
  acc2 = (n5*(n6+n7+n8)) / denominator2;
  
  //background(255);
  image(c,0,0);
  stroke(0);
  strokeWeight(2);
  
  translate(1200/2,800/2);
  
  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  float x2 = x1 + r2 * sin(a2);
  float y2 = y1+ r2 * cos(a2);
  
  line(0,0,x1,y1);
  fill(0);
  ellipse(x1,y1,m1,m1);
  
  line(x1,y1,x2,y2);
  fill(0);
  ellipse(x2,y2,m2,m2);
  
  velo1 += acc1;
  velo2 += acc2;
  a1 += velo1;
  a2 += velo2;
  
  
  c.beginDraw();
  c.translate(1200/2,800/2);
  c.strokeWeight(4);
  c.stroke(255,0,0,127);
  if(frameCount > 1)
  {
    c.line(x3,y3,x2,y2);
  }
  c.endDraw();
  
  x3 = x2;
  y3 = y2;
  
 
}
