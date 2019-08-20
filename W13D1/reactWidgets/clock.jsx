import React from 'react';

class Clock extends React.Component {

  constructor(props) {
    super(props)

    this.state = {
      time: new Date()
    };
    this.tick = this.tick.bind(this);
  }

  tick() {
    this.setState({time: new Date()})
  }
 
  componentDidMount(){
    this.intervalID = setInterval(this.tick, 1000);
    // debugger;
  }
 
  componentWillUnmount() {
    // debugger;
    clearInterval(this.intervalID)
  }

  render() {
    
    let hour = this.state.time.getHours();
    let min = this.state.time.getMinutes();
    let sec = this.state.time.getSeconds();

    hour = (hour < 10) ? `0${hour}` : hour;
    let amPM = hour >= 12 ? 'PM' : 'AM'
    hour = (hour > 12) ? `0${hour - 12}` : hour;
    min = (min < 10) ? `0${min}` : min;
    sec = (sec < 10) ? `0${sec}` : sec;

    let weekDays = [
      'Monday', 
      'Tuesday', 
      'Wednesday', 
      'Thursday', 
      'Friday', 
      'Saturday', 
      'Sunday'
    ]

    let months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ]


    let day = weekDays[this.state.time.getDay() - 1];
    let date = this.state.time.getDate();
    let month = months[this.state.time.getMonth()];
    let year = this.state.time.getFullYear();
    
    return <h1>
      <button onClick={this.props.remove}>Remove Date & Time</button>
      <br />
      Current Time:
      <br />
      {hour} : {min} : {sec} {amPM}
      <br />
      Current Date:
      <br />
      {day}, {month} {date}, {year}
    </h1>
   
  } 


}

export default Clock;