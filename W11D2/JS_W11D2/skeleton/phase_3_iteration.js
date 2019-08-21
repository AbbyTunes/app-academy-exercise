String.prototype.substrings = function () {
  let subs = [];
  for (let i = 0; i < this.length; i++) {
    for (let j = i; j < this.length; j++) {
      subs.push(this.slice(i, j + 1));
    }
  }
  return subs;
}

"abcd".substrings();

