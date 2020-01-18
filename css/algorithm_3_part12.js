function printAverage(x) {
   if (x === undefined || !Array.isArray(x) || x.length == 0) return undefined;
   sum = 0;
   x.forEach(element => {
      sum += element;
   });
   return sum / x.length;
}
y = printAverage([1,2,3]);
console.log(y); // should log 2
  
y = printAverage([2,5,8]);
console.log(y); // should log 5

function returnOddArray(){
   odd_array = [];
   for(let i=1; i<=255; i+=2) {
      odd_array.push(i);
   }
   return odd_array;
}
y = returnOddArray();
console.log(y); // should log [1,3,5,...,253,255]

function squareValue(x){
   for(let i=0; i<x.length; ++i) {
      x[i] *= x[i]; 
   }
   return x;
}
y = squareValue([1,2,3]);
console.log(y); // should log [1,4,9]
  
y = squareValue([2,5,8]);
console.log(y); // should log [4,25,64]