

function myFunc(name, age, color) {
  this.name = name;
  this.age = age;
  this.color = color;
}

Function.prototype.myBind = function(ctx) {
  // let allOtherArguments = arguments //Array like
  const theSliceFunction = Array.prototype.slice;
  const bindArgs = theSliceFunction.call(arguments, 1); // "bagel"
  // arguments is not array, so need to inherit .slice function from Array
  return function() {
    const callTimeArgs = [].slice.call(arguments);
    // only has bindArgs "bagel"
    const myFunc = this;
    myFunc.apply(ctx, bindArgs.concat(callTimeArgs))
  }
  allOtherArguments = [bindArg1, bindArg2]
}

// Function.prototype.myBind = function(ctx, ...bindArgs) {
//   const myFunc = this;
//   return function (...callArgs) {
//     myFunc.apply(ctx, ...bindArgs, ...callArgs);
//   }
// }
// bagel = new Cat();
// myFunc("bagel", 2, brown);
// setUpBagel = myFunc.bind(bagel, "bagel")
// setUpBagel(2, "green");
// ctx, arg1, arg2, arg3
// ["bagel", 2, "green"]
// myFunc("bagel", 2, "green")




// Andy's Walkthrough

// const dummyFunction = function(arg) {
//   console.log(`arg: `, arg);
//   console.log(`this: `, this);
// }
// myObj = {};
// const myBoundFn = dummyFunction.bind(myObj);
// myBoundFn(1);
// dummyFunction(1);
function Cohort(name) {
  this.name = name;
}
Cohort.prototype.printName = function () {
  console.log(this.name);
}
Cohort.prototype.printNames = function (name1, name2) {
  console.log(this.name, name1, name2);
}
const myCohort = new Cohort("5-27 Online - The best");
// myCohort.printName();
function Person(name) {
  this.name = name;
}
carlos = new Person("Carlos");
// carlos.printName();
// does carlos have a this.printName?
// does carlos's prototype have a printName?
const printCarlosName = Cohort.prototype.printName.bind(carlos)
// Now you can print Carlos name;
printCarlosName();

// Our own bind
// argumentsIAlwaysWantToPassIntoTheReturnedFunctionFirst
Function.prototype.myBind = function (object, ...bindArgs) {
  // this is pointing to the function (receiver of function invocation)
  const fn = this;
  // allArgsThisFunctionShouldBeInvokedWith
  return function (...callArgs) {
    // two other ways to invoke functions with a specific context
    // fn.bind(ctx)()
    // fn.call(ctx)
    // fn.apply(ctx)
    // this is pointing to scope where returned function is invoked
    // spread operator
    // ["Winnie", "Donnie"] => ... => "Winnie", "Donnie"
    // rest operator
    // "Winnie", "Donnie" => ... => ["Winnie", "Donnie"]
    fn.call(object, ...bindArgs, ...callArgs);
  }
}
// const printCarlosName2 = Cohort.prototype.printName.myBind(carlos, "Daniel");
// printCarlosName2();
// myCohort.printNames("Winnie", "Donnie");
myCohort.printNames.myBind(carlos, "Daniel")("Winnie", "Donnie");
// myBind with arrow function (CAN NOT DO ON TEST)
Function.prototype.myBind = function (ctx, ...bindArgs) {
  // this is etermined based on where it is defined
  return (...callArgs) => this.call(ctx, ...bindArgs, ...callArgs);
}


Function.prototype.myCurry = function (numArgs) {
  // keep track of arguments
  // eventually invoke this (the function)
}
function myCurry(fn, ctx, numArgs) {
  //keep track of arguments
  //invoke a passed function in a certain context
}
function inherits(parent, child) {
}
Function.prototype.inherits = function (child) {
}
Array.prototype.mergeSort = function (cb) {
}
function mergeSort(array, cb) {

}


