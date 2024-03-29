let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  let grid = [];

  for (i = 0; i < 8; i++) {
    let row = new Array(8);
    grid.push(row);
  }

  grid[3][4] = new Piece("black");
  grid[4][3] = new Piece("black");
  grid[3][3] = new Piece("white");
  grid[4][4] = new Piece("white");

  return grid;
}

/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid(); // initialize a grid
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if (!this.isValidPos(pos)) {
    throw new Error("Not valid pos!");
  }

  return this.grid[pos[0]][pos[1]]; 
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {
  let piece = this.getPiece(pos);
  
  return piece && piece.color === color; 
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return !!this.getPiece(pos); 
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) { // [2, 4]
  return (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8);
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) { // [-1, 0]

  if (!piecesToFlip) {
    piecesToFlip = [];
  } else {
    piecesToFlip.push(pos);
  }

  new_pos = [pos[0] + dir[0], pos[1] + dir[1]];

  if (!board.isValidPos(new_pos) || !board.isOccupied(new_pos)) {
    return null;
  } else if (board.isMine(new_pos, color)) {
    return (piecesToFlip.length === 0) ? false: piecesToFlip;
  } else {
    return _positionsToFlip(board, new_pos, color, dir);
  }
}

  // non-recursive
//   piecesToFlip = [pos];
//   new_pos = [pos[0] + dir[0], pos[1] + dir[1]];

//   while (!board.isMine(new_pos)) {
//     if (!board.isValidPos(new_pos)) {
//       return null;
//     }

//     piecesToFlip.push(new_pos);
//     new_pos = [pos[0] + dir[0], pos[1] + dir[1]];
//   }

//   return piecesToFlip;
// };

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if (!this.validMove(pos)) {
      throw new Error("Invalid Move");
  }

  let positions = [];
  for (let i = 0; i < Board.DIRS.length; i++) {
      positions = positions.concat(_positionsToFlip(this, pos, color, Board.DIRS[i]));
  }

    for (let i = 0; i < positions.length; i++) {
      this.getPiece(positions[i]).flip();
  }

    this.grid[pos[0]][pos[1]] = new Piece(color);
};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if (this.isOccupied(pos)) {
    return false;
  }

  for (let i = 0; i < Board.DIRS.length; i++) {
    const positions = _positionsToFlip(this, pos, color, Board.DIRS[i]);
      if (positions) {
        return true;
      }
  }

  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {

  let moves = [];
  for (let i = 0; i < this.grid.length; i++) {
    for (let j = 0; j < this.grid.length; j++) {
      if (this.validMove([i, j], color)) {
        moves.push([i, j]);
      }
    }
  }

  return moves;
};

module.exports = Board;
