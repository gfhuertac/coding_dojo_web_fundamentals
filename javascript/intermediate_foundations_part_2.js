// Create a function Fib(n) where it returns the nth Fibonacci number.  Use recursion for this.
function fibonacci(n) {
    if (n < 0) return 0;
    else if (n == 0) return 0;
    else if (n == 1) return 1;
    return fibonacci(n-1) + fibonacci(n-2);
}

// Recursive Fill - please see HTML file :)