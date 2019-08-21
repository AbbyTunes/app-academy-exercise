

Function.prototype.inherit = function(BaseClass) {
  
  const Surrogate = function () {};
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
}

// Function.prototype.inherits2 = function() {
//   this.prototype = Object.create(Subclass.prototype)
//   // this.prototype = Object.create.prototype
// }

function MovingObject() {
  this.name = "motherShip";
  this.size = 100;
}

function Ship() {
  this.name = "theShip";
  // this.size = 20
}
Ship.inherit(MovingObject);

function Asteroid() { }
Asteroid.inherits(MovingObject);


// `Function.prototype.inherits` using surrogate trick
// What is the goal?
// child inherit from parent / middleman
// accessing prototype functions
function Mothership(speciesOfAlien = "human") {
  // this function could potentially have expensive code
  this.species = speciesOfAlien;
  this.prison = [];
}
Mothership.prototype.abduct = function (target) {
  this.prison.push(target);
}
const motherShip = new Mothership("app academy student");
motherShip.abduct("job");
function FlyingSaucer() {
}
// give flying saucer objects access to functions defined on the mothership prototype
Function.prototype.inherits = function (parent) {
  // this?
  // FlyingSaucer
  // parent?
  // Mothership
  // this.prototype = parent.prototype;
  // the functions prototype have access to the parents prototype
  // create a prototype object
  // has access to the parents prototype via __proto__

  // create blank function
  function Surrogate() { };
  // reassign prototype
  Surrogate.prototype = parent.prototype;
  // create instance / just an object with the correct __proto__
  let myNewPrototype = new Surrogate();
  // assign that object as the child's prototype
  this.prototype = myNewPrototype;
  // fix constructor
  this.prototype.constructor = this;
}

FlyingSaucer.inherits(Mothership);
flyingSaucer = new FlyingSaucer();
Mothership.call(flyingSaucer);
flyingSaucer.abduct("bigfoot");
Function.prototype.inherits1 = function inherits1(BaseClass) {
  function Surrogate() { }
  Surrogate.prototype = BaseClass.prototype;
  this.prototype = new Surrogate();
  this.prototype.constructor = this;
};
// `Function.prototype.inherits` using `Object.create`
Function.prototype.inherits2 = function inherits2(BaseClass) {
  this.prototype = Object.create(BaseClass.prototype);
  this.prototype.constructor = this;
};
function Dog(name) {
  this.name = name;
}
Dog.prototype.bark = function bark() {
  console.log(this.name + " barks!");
};
function Corgi(name) {
  Dog.call(this, name);
}
Corgi.inherits1(Dog);
Corgi.prototype.waddle = function waddle() {
  console.log(this.name + " waddles!");
};
const blixa = new Corgi("Blixa");
blixa.bark();
blixa.waddle();