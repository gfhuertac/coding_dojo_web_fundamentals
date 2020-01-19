// Sigma - Implement function sigma(num) that, given a number, returns the sum of all positive integers up to the given number (inclusive).  Ex: sigma(3) = 6 (or 1+2+3); sigma(5) = 15 (or 1+2+3+4+5).
function sigma(num) {
    let sum = 0;
    for(let i=0; i<=num; ++i) {
        sum += i;
    }
    return sum;
} // or n*(n+1)/2 :)

// Factorial - Write a function factorial(num) that, given a number, returns the product (multiplication) of all positive integers from 1 up to the given number (inclusive).  For example, factorial(3) = 6 (or 1*2*3); factorial(5) = 120 (or 1*2*3*4*5).
function factorial(num) {
    let mul = 1;
    for(let i=1; i<=mul; ++i) {
        mul *= i;
    }
    return mul;
}

// Fibonacci - Create a function to generate Fibonacci numbers.  In this famous mathematical sequence, each number is the sum of the previous two, starting with values 0 and 1.  Your function should accept one argument, an index into the sequence (where 0 corresponds to the initial value, 4 corresponds to the value four later, etc).  Examples: fibonacci(0) = 0 (given), fibonacci(1) = 1 (given), fibonacci(2) = 1 (fib(0)+fib(1), or 0+1), fibonacci(3) = 2 (fib(1) + fib(2)3, or 1+1), fibonacci(4) = 3 (1+2), fibonacci(5) = 5 (2+3), fibonacci(6) = 8 (3+5), fibonacci(7) = 13 (5+8).  Do this without using recursion first.  If you don't know what a recursion is yet, don't worry as we'll be introducing this concept in Part 2 of this assignment.
function fibonacci(index) {
    if (index == 0) return 0;
    else if (index == 1) return 1;
    let n_2 = 0;
    let n_1 = 1;
    let n = 1;
    for(let i=2; i<index; ++i) {
        n_2 = n_1;
        n_1 = n;
        n = n_1 + n_2;
    }
    return n;
}

// Array: Second-to-Last: Return the second-to-last element of an array. Given [42, true, 4, "Liam", 7], return "Liam".  If array is too short, return null.
function secondToLast(arr) {
    if (arr === undefined || !Array.isArray(arr) || arr.length < 2) return undefined;
    return arr[arr.length-2];
}

// Array: Nth-to-Last: Return the element that is N-from-array's-end.  Given ([5,2,3,6,4,9,7],3), return 4.  If the array is too short, return null.
function nToLast(arr, N) {
    if (arr === undefined || !Array.isArray(arr) || arr.length < N) return undefined;
    return arr[arr.length-N];
}

// Array: Second-Largest: Return the second-largest element of an array. Given [42,1,4,3.14,7], return 7.  If the array is too short, return null.
function secondLargest(arr) {
    if (arr === undefined || !Array.isArray(arr) || arr.length < 2) return undefined;
    let max = second = Number.MIN_SAFE_INTEGER;
    arr.forEach((element) => {
        if (element > max) {
            second = max;
            max = element;
        } else if (element > second) {
            second = element;
        }
    });
    return second;
}

// Double Trouble: Create a function that changes a given array to list each existing element twice, retaining original order.  Convert [4, "Ulysses", 42, false] to [4,4, "Ulysses", "Ulysses", 42, 42, false, false].
function doubleTrouble(arr) {
    let l = arr.length;
    for (let i = 0; i < l; ++i) arr.push(undefined);
    for (let i = 2 * l - 1; i >= 0; i -= 2) {
       let middle = Math.floor(i / 2);
       arr[i] = arr[middle];
       arr[i - 1] = arr[i];
    }
    return arr;
 }