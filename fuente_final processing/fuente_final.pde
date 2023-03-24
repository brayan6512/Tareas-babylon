// Clase para la partícula
class Particle {
  float x, y;    // posición de la partícula
  float vx, vy;  // velocidad de la partícula
  float size;    // tamaño de la partícula
  float lifespan; // vida útil de la partícula
  color col;     // color de la partícula
  
  // Constructor de la partícula
  Particle(float x_, float y_, float vx_, float vy_, float size_, color col_) {
    x = x_;
    y = y_;
    vx = vx_;
    vy = vy_;
    size = size_;
    lifespan = 255;
    col = col_;
  }
  
  // Actualizar la posición de la partícula
  void update() {
    x += vx;
    y += vy;
    vy += 0.1; // gravedad
    lifespan -= 1;
  }
  
  // Dibujar la partícula
  void display() {
    noStroke();
    fill(red(col), green(col), blue(col), lifespan);
    ellipse(x, y, size, size);
  }
  
  // Comprobar si la partícula está muerta
  boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
}

// Número de partículas en el arreglo
int n = 200;

// Arreglo de partículas
Particle[] particles = new Particle[n];

// Posición de la fuente de agua
float sourceX = 460;
float sourceY = 505;

void setup() {
  size(900, 900);
  
  
  // Inicializar cada objeto de partícula en el arreglo
  for (int i = 0; i < n; i++) {
   float vx = 1;
    float vy = -8;
    float size = 5;
    color col = color(0);
    particles[i] = new Particle(sourceX, sourceY, vx, vy, size, col);
  }
}

void draw() {
  background(255);
  noFill();
  stroke(0);
  bezier(100, 500, 25, 500, 800, 500, 50, 800);
  bezier(750, 500, 850, 500, 25, 500, 850, 800);
  line(50, 800,850, 800);
  ellipse(450,500,800,20);
  ellipse(430,500,300,15);
  ellipse(430,500,20,7);
  ellipse(400,500,20,7);
  ellipse(460,500,20,7);
  
  // Agregar nuevas partículas a la fuente de agua
   for (int i = 0; i < 5; i++) {
    float vx = -1;
    float vy = -8;
    float size = 5;
    color col = color(0);
    Particle p = new Particle(405, 505, vx, vy, size, col);
    particles = (Particle[])append(particles, p);
  }
  for (int i = 0; i < 5; i++) {
    float vx = -0.15;
    float vy = -8;
    float size = 5;
    color col = color(0);
    Particle p = new Particle(430, 505, vx, vy, size, col);
    particles = (Particle[])append(particles, p);
  }
  for (int i = 0; i < 5; i++) {
    float vx = 1;
    float vy = -8;
    float size = 5;
    color col = color(0);
    Particle p = new Particle(sourceX, sourceY, vx, vy, size, col);
    particles = (Particle[])append(particles, p);
  }
  
  // Actualizar y dibujar cada partícula
  for (int i = 0; i < particles.length; i++) {
    particles[i].update();
    particles[i].display();
    
    // Si la partícula está muerta, eliminarla del arreglo
    if (particles[i].isDead()) {
      particles = (Particle[])subset(particles, i+1);
    }
  }
}
