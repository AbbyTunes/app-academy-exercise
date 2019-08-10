

function curriedSum(numArgs) {
  let numbers = [];
      // 1, 2, 3,
  function _curriedSum(arg) {
      numbers.push(arg);
    if (numbers.length === numArgs) {
            let result = 0;
        numbers.forEach(num => result += num)
        // numbers.forEach(num) {
        //   result += num;
        // }
        return result;
    } else {
        return _curriedSum;
    }
  }
}

const curriedAdd = curriedSum(3);
curriedAdd()(2)(3)(4);

// cat.curry(args)
// EatBananas.curry(4)

Function.prototype.curry = function (numArgs) {
    let args = [];
    let fn = this;
    funtion _curriedTwo(arg) {
        args.push(arg)
        if (args.length === numArgs) {
            return fn(...args)
            //  can use this. if it's flat arrow function
        //   let subSum = 0;
        //   this.forEach(arg) {
        //     subSum += arg;
        //   }
        //   return subSum;
        } else {
            return _curriedTwo
//             return _curriedTwo;
        }
    }
    return _curriedTwo
}