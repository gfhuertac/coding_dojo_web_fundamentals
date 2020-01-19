// Get 1 to 255 - Write a function that returns an array with all the numbers from 1 to 255.
function get1To255() {
    let arr = [];
    for (let i = 1; i <= 255; ++i) {
        arr.push(i);
    }
    return arr;
}

// Get even 1000 - Write a function that would get the sum of all the even numbers from 1 to 1000.  You may use a modulus operator for this exercise.
function getEven1000() {
    let sum = 0;
    for (let i = 0; i <= 1000; i += 2) {
        sum += i;
    }
    return sum;
}

// Sum odd 5000 - Write a function that returns the sum of all the odd numbers from 1 to 5000. (e.g. 1+3+5+...+4997+4999).
function sumOdd5000() {
    let sum = 0;
    for (let i = 1; i < 5000; i += 2) {
        sum += i;
    }
    return sum;
}

// Iterate an array - Write a function that returns the sum of all the values within an array. (e.g. [1,2,5] returns 8. [-5,2,5,12] returns 14).
function arraySum(arr) {
    let sum = 0;
    arr.forEach((element) => {
        sum += element;
    });
    return sum;
}

// Find max - Given an array with multiple values, write a function that returns the maximum number in the array. (e.g. for [-3,3,5,7] max is 7)
function findMax(arr) {
    let max = arr[0];
    arr.forEach((element) => {
        if (element > max) max = element;
    });
    return max;
}

// Find average - Given an array with multiple values, write a function that returns the average of the values in the array. (e.g. for [1,3,5,7,20] average is 7.2)
function findAverage(arr) {
    let sum = 0;
    arr.forEach((element) => {
        sum += element;
    });
    return sum / arr.length;
}

// Array odd - Write a function that would return an array of all the odd numbers between 1 to 50. (ex. [1,3,5, .... , 47,49]). Hint: Use 'push' method.
function getOdd50() {
    let arr = [];
    for (let i = 1; i < 50; i+=2) {
        arr.push(i);
    }
    return arr;
}

// Greater than Y - Given value of Y, write a function that takes an array and returns the number of values that are greater than Y. For example if arr = [1, 3, 5, 7] and Y = 3, your function will return 2. (There are two values in the array greater than 3, which are 5, 7).
function greaterThanY(arr, Y) {
    let sum = 0;
    arr.forEach((element) => {
        if (element > Y) ++sum;
    });
    return sum;
}

// Squares - Given an array with multiple values, write a function that replaces each value in the array with the value squared by itself. (e.g. [1,5,10,-2] will become [1,25,100,4])
function squares(arr) {
    arr.forEach((element, index) => {
        arr[index] = element**2;
    });
    return arr;
}

// Negatives - Given an array with multiple values, write a function that replaces any negative numbers within the array with the value of 0. When the program is done the array should contain no negative values. (e.g. [1,5,10,-2] will become [1,5,10,0])
function negatives(arr) {
    for(let i=0; i<arr.length; ++i) {
        if(arr[i]<0) arr[i]=0;
        // or arr[i] = Math.max(0, arr[i]);
    }
    return arr;
}

// Max/Min/Avg - Given an array with multiple values, write a function that returns a new array that only contains the maximum, minimum, and average values of the original array. (e.g. [1,5,10,-2] will return [10,-2,3.5])
function maxMinAvg(arr) {
    let min = max = arr[0];
    let avg = 0;
    arr.forEach((element) => {
        if (element<min) min = element;
        if (element>max) max = element;
        avg += element;
    });
    return [max, min, avg/arr.length];
}

// Swap Values - Write a function that will swap the first and last values of any given array. The default minimum length of the array is 2. (e.g. [1,5,10,-2] will become [-2,5,10,1]).
function swapValues(arr) {
    let temp = arr[0];
    let l = arr.length;
    arr[0] = arr[l-1];
    arr[l-1] = temp;
    return arr;
}

// Number to String - Write a function that takes an array of numbers and replaces any negative values within the array with the string 'Dojo'. For example if array = [-1,-3,2], your function will return ['Dojo','Dojo',2].
function negativesToString(arr) {
    for(let i=0; i<arr.length; ++i) {
        if(arr[i]<0) arr[i]='Dojo';
    }
    return arr;
}