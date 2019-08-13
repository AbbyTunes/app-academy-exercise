const MovingObject = require("./moving_object.js")
const Util = require("./util.js")

const Asteroid = function (options) {
    this.pos = options.pos;
    this.vel = options.vel;
    this.radius = options.radius;
    this.color = options.color;
}

// class Asteroid extends MovingObject {
//     constructor(pos, vel, radius, color) {
//       super(pos, vel);
//       this.pos = pos;
//       this.vel = Util.randomVec(10);
//       this.radius = 25;
//       this.color = "red";
//     }
// }

// new Asteroid({ pos: [30, 30] });
// MovingObject.inherits(Asteroid)

// const Util = {
//     randomVec(length) {
//         const deg = 2 * Math.PI * Math.random();
//         return Util.scale([Math.sin(deg), Math.cos(deg)], length);
//     },
//     // Scale the length of a vector by the given amount.
//     scale(vec, m) {
//         return [vec[0] * m, vec[1] * m];
//     }
// }


Util.inherits(Asteroid, MovingObject);


module.exports = Asteroid;