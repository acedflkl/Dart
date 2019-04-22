import 'dart:html';

CanvasElement context;
CanvasRenderingContext2D ctx;

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

  Ball(this.x, this.y, this.r, this.vx, this.vy);

  void drawBall() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.r, 0, 3.14 * 2);
    ctx.fillStyle = "yellow";
    ctx.fill();
    ctx.closePath();
  }

  void update() {
    this.vx *= .99;
    this.vy *= .99;
    this.vy += .25;
    this.x += this.vx;
    this.y += this.vy;
    if (this.y + this.r > context.height) {
      this.y = context.height - this.r;
      this.vy = this.vy * -1;
    }
    if (this.x + this.r > context.width) {
      this.x = context.width - this.r;
      this.vx = this.vx * -1;
    }
  }

  void drawMove(MouseEvent event) {
      clear();
      update();
      drawBall();
  }
}

void main() {
  context = querySelector('#canvas');
  ctx = context.getContext('2d');
  ctx..fillStyle = "green";
  ctx..strokeStyle = "blue";
  var ball = Ball(50, 50, 15, 2, 3);
  ball.drawBall();
  querySelector("#canvas").onClick.listen(ball.drawMove);
}
