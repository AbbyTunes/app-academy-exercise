import Board from './board';
import React, { Component } from 'react'

export default class Tile extends Component {

    constructor (props){
        super(props);
        // this.idx = []

        this.handleClick = this.handleClick.bind(this);
    }
    handleClick(e){
        // console.log(this.props.tile.bombed);
        if (this.props.tile.flagged){
            e.target.classList.toggle("flag");
            // e.target.classList.toggle("bomb");
            // e.target.classList.toggle("explore");
            // this.setState({ board: "tileFlagged" });
        }
        
        else if (this.props.tile.bombed){
            let result = e.target.classList.toggle("bomb");
            // this.setState({ bombed: result };
        }
        else 
            e.target.classList.toggle("explore");
        // if (this.props.tile.explored)


        // this.setState({ flag: tileFlagged });
    }


    render() {
        return (
            <li className="tile" 
                onClick={this.handleClick}>
            </li>
        )
    }
}

