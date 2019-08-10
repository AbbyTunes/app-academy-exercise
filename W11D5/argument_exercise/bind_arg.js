

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



