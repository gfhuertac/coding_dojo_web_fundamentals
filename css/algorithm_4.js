//Given an array and a value Y, 
// count and print the number of array values greater than Y.

function countAndPrint(arr, Y) {
   let count = 0;
   arr.forEach((element) => {
      if (element > Y) {
         ++count;
      }
   });
   return count;
}
console.log(countAndPrint([1, 2, 3, 4, 5], 3));

//Given an array, 
// print the max, min and average values for that array.
function minAvgMax(arr) {
   let result = [arr[0], arr[0], arr[0]];
   for (let i = 1; i < arr.length; ++i) {
      if (arr[i] < result[0])
         result[0] = arr[i];
      if (arr[i] > result[2])
         result[2] = arr[i];
      result[1] += arr[i];
   }
   result[1] /= arr.length;
   return result;
}
console.log(minAvgMax([1, 2, 3, 4, 5]));

//Given an array of numbers, 
// create a function that returns a new array where negative values were replaced with the string ‘Dojo’.
// For example, replaceNegatives( [1,2,-3,-5,5]) should return [1,2, "Dojo", "Dojo", 5].
function replaceNegatives(arr) {
   for (let i = 0; i < arr.length; ++i) {
      if (arr[i] < 0)
         arr[i] = 'Dojo';
   }
   return arr;
}
console.log(replaceNegatives([1, 2, -3, -5, 5]));

//Given array, and indices start and end, 
// remove values in that index range, working in-place (hence shortening the array).
// For example, removeVals([20,30,40,50,60,70],2,4) should return [20,30,70].
function removeVals(arr, start, end) {
   for (let i = 0; i <= (end-start); ++i) {
      if (start+i < arr.length) arr[start+i] = arr[arr.length-1];
      arr.pop();
   }
   return arr;
}
console.log(removeVals([20, 30, 40, 50, 60, 70], 2, 4));