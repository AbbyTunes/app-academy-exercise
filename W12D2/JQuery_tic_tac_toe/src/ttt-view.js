class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    this.$el.on("click", "li", (e) => {
      const $li = $(e.currentTarget);
      this.makeMove($li);
    });
  }

  makeMove($square) {
    // if pos's class = "selected" show error
    try {
      this.game.playMove($square.data("pos"));
    } catch (error) {
      alert(error.msg);
      return;
    }

    $square.addClass("selected");
    let piece = this.game.currentPlayer;
    // piece.addClass("marks");
    $square.append(piece);    //<li class="selected">X</li>
    // $square.attr(class, piece)

    if (this.game.currentPlayer === "x") {
      $square.addClass("x");
    } else {
      $square.addClass("o");
    }

    if (this.game.isOver()) {
      const winner = this.game.winner();
      alert(`${winner} won the game!`);
    }

  }

  setupBoard() {
    const $ul = $("<ul>");
    for (let i = 0; i < 3; i++) {      //=> [[[],[],[]],[[],[],[]],[[],[],[]]]
      for (let j = 0; j < 3; j++) {
        let $li = $("<li>");
        $li.data("pos", [i, j]);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
  }
}

module.exports = View;
