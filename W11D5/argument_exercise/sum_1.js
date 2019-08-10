
function sum() {
    let count = 0;
    for (let i = 0; i < arguments.length; i++) {
        count += arguments[i];
    }
    return count;
}
sum(1, 2, 3);


function sum(...args) {
  let count = 0;
  for (let i = 0; i < args.length; i++) {
      count += args[i];
  }
  return count;
}

sum(1, 2, 3);

// *args
// const sum1 = function (...args) {
//   let count = 0;
//   for (let i = 0; i < args.length; i++) {
//     count += args[i];
//   }
//   return count;
// }

// sum1(1, 2, 3);
