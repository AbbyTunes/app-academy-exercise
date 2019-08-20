import React from 'react';
import ReactDOM from 'react-dom';

import Clock from './clock';
import Tabs from './tabs';

// function Root () {
//   return <div>
//     <Clock />
//   </div>
// }

class Root extends React.Component {
  constructor(props){
    super(props);
    this.state = {clock: true};

    this.toggleClock = this.toggleClock.bind(this);
  }

  toggleClock (){
    this.setState({clock: !this.state.clock})
  }

  render (){
    if (this.state.clock){
      return (
        <div>
          <Clock remove={this.toggleClock} />
          <Tabs />
        </div>
      )
    } else {
      return <div onClick={this.toggleClock}>No Clock</div>
    }
  }
}

document.addEventListener('DOMContentLoaded', () => {
  const root = document.getElementById('root');
  ReactDOM.render(<Root />, root);
});