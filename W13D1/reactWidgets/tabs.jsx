import React from 'react';

class Tabs extends React.Component {
  constructor (props) {
    super(props);
    this.title;
    this.content;
    
    this.state = { index: 0 };
  }

  selectTab() {
    this.setState({ index: 1 })
    // this.setState({ clock: !this.state.clock })
  }

  render (){
    return ( 
      <potato>
        <header onClick={this.selectTab}>Header {this.title}</header>
        <h2>This is in the Tab Component</h2>
      
        <ul>
          <h1>{this.title}</h1>
        </ul>
        <article>{this.content}</article>
      </potato>
    )
  }
}

/* <div onClick={this.toggleClock}>No Clock</div> */

// arrObj = [ {title: 1, content: A}, {title:2, content: B}]

export default Tabs;