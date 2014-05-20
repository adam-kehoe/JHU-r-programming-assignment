# Caching the Inverse of a Matrix

This R file contains two functions demonstrating the basic principle of memoization in R by calculating and caching the inverse of a matrix. The first function, makeCacheMatrix, creates an object that can cache the inverse of a matrix. The purpose of memoization is to store the results of costly computations and avoid repeated calculations.

The second function, cacheSolve, first attempts to retrieve a stored inverse matrix. If one exists, it returns that matrix. If one does not exist, it calculates the inverse, stores the result, and then returns the inverse matrix.
