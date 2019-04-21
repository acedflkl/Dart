import 'dart:html';
import 'dart:math' as Math;

CanvasElement context;
CanvasRenderingContext2D ctx;
int x = 20;
int y = 30;

void clear() {
  ctx..fillStyle = "blue";
  ctx..fillRect(0, 0, context.width, context.height);
}

class Ball {
  double x;
  double y;
  double r;
  double vx;
  double vy;

  Ball() {
    this.x = 50;
    this.y = 50;
    this.r = 15;
    this.vx = 0;
    this.vy = 0;
  }

  void drawBall() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.r, 0, 3.14 * 2);
    ctx.fillStyle = "yellow";
    ctx.fill();
    ctx.closePath();
  }

  void drawMove(MouseEvent event) {
    while (this.y + this.r < context.height) {
      this.x += this.vx;
      this.y += this.vy;
      this.vx *= .99;
      this.vy *= .99;
      this.vy += .25;
      this.vx += .25;
    }

    if (this.y + this.r > context.height) {
      this.y = context.height - this.r;
      this.vy = this.vy.abs();
    }
    if (this.x + this.r > context.width) {
      this.x = context.width - this.r;
      this.vx = this.vx.abs();
    }
    clear();
    drawBall();
  }
}

void main() {
  context = querySelector('#canvas');
  ctx = context.getContext('2d');
  ctx..fillStyle = "green";
  ctx..strokeStyle = "blue";
  var ball = Ball();
  ball.drawBall();
  querySelector("#canvas").onClick.listen(ball.drawMove);
}
