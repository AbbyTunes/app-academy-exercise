// const MovingObject = require("./moving_object.js")
// const Asteroid = require("./asteroid.js")
// const Util = require("./util.js")
const MovingObject = require("./moving_object.js")
const Asteroid = require("./asteroid.js")
const Util = require("./util.js")

const Game = require("./game.js")
const GameView = require("./game_view.js")

console.log("adfasgasfd")
console.log("Welcome to the game")


// HAPPENS once the page loads, html on page
// window.addEventListener('DOMContentLoaded', (event) => {
//     const canvas = document.getElementById("game-canvas");
//     const context = canvas.getContext("2D");
//     console.log('we called event listener');

//     let mo = new MovingObject(
//       {pos: [30, 30], vel: [10, 10], radius: 5, color: "#00FF00" }
//     );

//     mo.draw(context);
// });


window.addEventListener("DOMContentLoaded", function () {
    // MOVING OBJECT STUFF
  const canvas = document.getElementById("game-canvas");
  const ctx = canvas.getContext('2d');

    // const newGame = new Game();
    // newGame.addAsteroids();
    // newGame.randomPosition();


    const newGameView = new GameView(ctx);
    newGameView.start();



// newGame.draw();
  // let mo = new MovingObject(
  //     {pos: [30, 30], vel: [10, 10], radius: 30, color: "#00FF00" }
  //   );

  // mo.draw(ctx);
  // mo.move();
//   ctx.clearRect(0,0,500,500);
//   ctx.fillRect(0,0,500,500);
//   mo.draw(ctx);
 

  // console.log(ctx);

//   let asteroid = new Asteroid(
//       { pos: [150, 150], vel: [20, 20], radius: 50, color: "#00008B" }
//   );
//   asteroid.draw(ctx);
//   asteroid.move();

});

window.MovingObject = MovingObject;
window.Util = Util;
window.Asteroid = Asteroid;
window.Game = Game;

//   ctx.fillStyle = 'green';
//   ctx.fillRect(10, 10, 150, 100);

// //MY HOUSE TESTING
//     const canvas2 = document.getElementById('my-house');
//     const ctx2 = canvas2.getContext('2d');
//     // Set line width
//     ctx2.lineWidth = 10;

//     // Wall
//     ctx2.strokeRect(75, 140, 150, 110);

//     // Door
//     ctx2.fillRect(130, 190, 40, 60);

//     // Roof
//     ctx2.moveTo(50, 140);
//     ctx2.lineTo(150, 60);
//     ctx2.lineTo(250, 140);
//     ctx2.closePath();
//     ctx2.stroke();

// const canvasEl = document.getElementsByTagName("canvas")[0];
// canvasEl.height = window.innerHeight;
// canvasEl.width = window.innerWidth;
// new Game(
//   canvasEl.width,
//   canvasEl.height
// ).start(canvasEl);

