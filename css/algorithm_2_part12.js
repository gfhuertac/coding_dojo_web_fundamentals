function printUpTo(x) {
   if (x < 0) {
      console.log("negative number!");
      return false;
   }
   for (let i = 0; i < x; ++i) {
      console.log(i + 1);
   }
}

printUpTo(1000); // should print all the integers from 1 to 1000
y = printUpTo(-10); // should return false
console.log(y); // should print false

function printSum(x) {
   let sum = 0;
   for (let i = 0; i <= x; ++i) {
      sum += i;
      console.log(i + ' : ' + sum);
   }
   return sum
}
y = printSum(255) // should print all the integers from 0 to 255 and with each integer print the sum so far.
console.log(y) // should print 32640

function printSumArray(x) {
   let sum = 0;
   x.forEach(element => {
      sum += element;
   });
   return sum;
}
console.log(printSumArray([1, 2, 3])); // should log 6

function largestElement(x) {
   if (x === undefined || !Array.isArray(x) || x.length == 0) return undefined;
   let max = x[0];
   x.forEach(element => {
      if (element > max) max = element;
   });
   return max;
}
console.log(largestElement([1, 30, 5, 7])); // should log 30