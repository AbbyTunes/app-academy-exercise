const Asteroid = require("./asteroid.js")


const Game = function () {
    DIM_X: 30;
    DIM_Y: 80;
    NUM_ASTEROIDS: 5;
    this.asteroids = [];
}

function getRndInteger(min, max) {
    return Math.floor(Math.random() * (max - min)) + min;
}

Game.prototype.addAsteroids = function () {

    // GREEN
  const a1 = new Asteroid(
    { pos: [30, 30], vel: [10, 10], radius: 25, color: "#00FF00" }
  );

  //BLUE
  const a2 = new Asteroid(
    { pos: [150, 150], vel: [20, 20], radius: 20, color: "#00008B" }
  );
  //RED
  const a3 = new Asteroid(
      { pos: [200, 250], vel: [20, 20], radius: 12, color: "#A52A2A" }
  );
  this.asteroids.push(a1);
  this.asteroids.push(a2);
  this.asteroids.push(a3);
}

Game.prototype.randomPosition = function () {
    return [getRndInteger(0, 500), getRndInteger(0, 500)];
}

Game.prototype.draw = function (ctx) {
  this.asteroids.forEach( function (asteroid) {
    console.log(ctx)
    ctx.clearRect(0,0,500,500);
    asteroid.draw(ctx);
  });
}

Game.prototype.moveObjects = function () {
    this.asteroids.forEach((asteroid) => asteroid.move());
}

Game.prototype.wrap = function (pos) {
    if (pos[0] > 500) {
        pos[0] = 1;
    } else if (pos[0] === 0) {
        pos[0] = 500;
    } else if (pos[1] > 500) {
        pos[1] = 1;
    } else if (pos[1] === 0) {
        pos[1] = 500;
    }
}

module.exports = Game;