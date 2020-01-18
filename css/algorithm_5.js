// Return the given array, after setting any negative values to zero.  
// For example resetNegatives( [1,2,-1, -3]) should return [1,2,0,0].
function resetNegatives(arr) {
   for (let i = 0; i < arr.length; ++i) {
      if (arr[i] < 0)
         arr[i] = 0;
   }
   return arr;
}
console.log(resetNegatives([1, 2, -1, -3]));

// Given an array, move all values forward by one index, dropping the first and leaving a ‘0’ value at the end. 
// For example moveForward( [1,2,3]) should return [2,3,0].
function moveForward(arr) {
   for (let i = 1; i < arr.length; ++i) {
      arr[i - 1] = arr[i];
   }
   arr[arr.length - 1] = 0;
   return arr;
}
console.log(moveForward([1, 2, 3]));

// Given an array, return an array with values in a reversed order.  
// For example, returnReversed([1,2,3]) should return [3,2,1].
function returnReversed(arr) {
   let l = arr.length;
   for (let i = 0; i < l / 2; ++i) {
      let temp = arr[i];
      arr[i] = arr[l - i - 1];
      arr[l - i - 1] = temp;
   }
   return arr;
}
console.log(returnReversed([1, 2, 3]));

// Create a function that changes a given array to list each original element twice, retaining original order.  
// Have the function return the new array.  
// For example repeatTwice( [4,”Ulysses”, 42, false] ) should return [4,4, “Ulysses”, “Ulysses”, 42, 42, false, false].
function repeatTwice(arr) {
   let l = arr.length;
   for (let i = 0; i < l; ++i) arr.push(undefined);
   for (let i = 2 * l - 1; i >= 0; i -= 2) {
      let middle = Math.floor(i / 2);
      console.log(i + ' <-- ' + middle);
      console.log((i-1) + ' <-- ' + arr[middle]);
      arr[i] = arr[middle];
      arr[i - 1] = arr[i];
   }
   return arr;
}
console.log(repeatTwice([4, 'Ulysses', 42, false]));
console.log(repeatTwice([4, 'Ulysses', 42]));
