import React from 'react';
import Tile from './tile';

export default class Board extends React.Component {
  //<Board board={this.state.board} updateGame={this.updateGame} />
  constructor(props){
      super(props);
  }
  render() {
    return (
      <div className="board">
        <ul>
          {this.renderRow()}
        </ul>
        
      </div>
    );
  }
  renderRow(){
    return this.props.board.grid.map((row, i) => {
      return (
        <div>
          {this.renderTile(row, i)}
        </div>
        )
      });
  }
  renderTile(row, i){
    const board = this.props.board;
    return row.map((tile, j) => {
      return <Tile tile={tile} updateGame={this.props.updateGame} rowIdx={i} colIdx={j}/>;
    });
  }
}


// render: 5*5

// renderRow: 5*1

// renderTile: 1*1