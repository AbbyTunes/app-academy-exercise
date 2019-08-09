const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numLeft, completionCallback) {
  if (numLeft > 0) {
    reader.question("Type in a num: ", function(string) {
      const num = parseInt(string);
      sum += num;
      console.log("Partial Sum: " + sum);
      addNumbers(sum, numLeft, completionCallback);
    });
  } else {
    completionCallback(sum);
  }
}

addNumbers(0, 3, function (sum) {
  console.log("Total Sum: " + sum);
  reader.close();
}
);