import React from 'react';
import ReactDOM from 'react-dom';
import * as Minesweeper from '../minesweeper';
import Board from './board';

export default class Game extends React.Component {

  constructor(props) {
    super(props);
    this.board = new Minesweeper.Board(5, 4);
    this.state = { board: this.board };
    this.updateGame = this.updateGame.bind(this);
  }

  updateGame() {
    // setState = { board: this.state.board }
    console.log("updating game");
    
  }

  render() {
    return (
      <div>
        Inside game class
        <Board board={this.state.board} updateGame={this.updateGame} />

      </div>

    )
  }
}
