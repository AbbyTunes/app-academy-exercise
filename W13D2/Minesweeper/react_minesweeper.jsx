import Game from './frontend/game';
import React from 'react';
import ReactDOM from 'react-dom';

class React_minesweeper extends React.Component {
    render() {
        return (
            <div>
                <Game />
                text from react_minesweeper
            </div>
        )
    }
}


document.addEventListener('DOMContentLoaded', () => {
    ReactDOM.render(<React_minesweeper />, document.getElementById('root'));
});