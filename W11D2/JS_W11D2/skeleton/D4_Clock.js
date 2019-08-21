// function Clock() {
//   // stuff I'd put in the constructor
// }

// Clock.prototype.printTime = function() {
//   // I need this! (to be the instance) ^^^

// }


class Clock {
  constructor() {
    // 1. Create a Date object.
    const currentTime = new Date();

    // 2. Store the hour, minute, and second.
    // this is an object, and we're setting a property on it
    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();

    // 3. Call printTime.
    this.printTime();
    // 4. Schedule the tick at 1 second intervals, and I want to print time also.
    // const functionThatInvokesTick = () => this._tick();
    // setInterval(functionThatInvokesTick, 1000);
    // setInterval(this._tick.bind(this), 1000);
    // setInterval(() => this._tick(), 1000);

    // this._tick
    // going to look for a property on myself (this)
    // next, assuming I don't find it, I will look through 
    // my __proto__ (which points)
    // to my constructor's prototype
    // And look there

    // that means, I can define a new property of the same name
    // to overwrite a prototype function!
    // const boundTick = this._tick.bind(this);
    // this._tick = boundTick;

    // the way we see it in nature

    this._tick = this._tick.bind(this);
  }

  bindMyTick() {
    this._tick = this._tick.bind(this);
  }

  // I'm on the prototype!
  printTime() {
    // Format the time in HH:MM:SS
    const timeString = [this.hours, this.minutes, this.seconds].join(":");

    // Use console.log to print it.
    console.log(timeString);
  }

  _tick() {
    // 1. Increment the time by one second.
    this._incrementSeconds();

    // 2. Call printTime.
    this.printTime();
  }

  _incrementSeconds() {
    // 1. Increment the time by one second.
    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0;
      this._incrementMinutes();
    }
  }

  _incrementMinutes() {
    this.minutes += 1;
    if (this.minutes === 60) {
      this.minutes = 0;
      this._incrementHours();
    }
  }

  _incrementHours() {
    this.hours = (this.hours + 1) % 24;
  }
}

// const clock = new Clock();
// clock.bindMyTick();
// setInterval(clock._tick, 1000);


// console.log("hey hold on a second");
// setTimeout(() => console.log("time is passing"), 0) /* adding it into the queue*/
// console.log("two seconds have passed")
