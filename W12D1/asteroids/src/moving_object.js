const Game = require("./game.js")


function MovingObject(obj) {
  this.pos = obj.pos;
  this.vel = obj.vel;
  this.radius = obj.radius;
  this.color = obj.color;
}


// const mo = new MovingObject(
//   { pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00" }
// );
// console.log(mo)

// function MovingObject(...args) {
//   this.pos = pos;
//   this.vel = vel;
//   this.radius = radius;
//   this.color = color;
// }
// const movingObject = new MovingObject();


MovingObject.prototype.draw = function (ctx) {
    // console.log(this.pos);
    // console.log(ctx);


    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
        this.pos[0],
        this.pos[1],
        this.radius,
        0,
        2 * Math.PI,
        false
    );

    ctx.fill();
}

MovingObject.prototype.move = function () {

    //WRAP LOGIC

  let newX = this.pos[0] + this.vel[0];
  let newY = this.pos[1] + this.vel[1];

  this.pos[0] = newX;
  this.pos[1] = newY;
}

module.exports = MovingObject