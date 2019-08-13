const Game = require("./game.js")


const GameView = function (ctx) {
    this.game = new Game();
    this.game.addAsteroids();
    this.ctx = ctx;

}

GameView.prototype.start = function () {
    setInterval(() => {
      this.game.moveObjects();
      this.game.draw(this.ctx);
    }, 200);
    
}


// const newGame = new Game();
// newGame.addAsteroids();
// newGame.randomPosition();
// newGame.draw();

module.exports = GameView;