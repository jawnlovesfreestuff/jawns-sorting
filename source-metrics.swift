// Computer Science II, Period 6
// John Nguyen
// 6-April-2018
// Sort Metrics

import Foundation


/********************************************************************************
| Types
********************************************************************************/
enum Orderness {
    case ascending
    case descending
    case random         
}


/********************************************************************************
| Functions
********************************************************************************/
func random(min:Int, max:Int) -> Int
{
    let range = max - min + 1
    return min + random() % range
}


/********************************************************************************
| Preparations
********************************************************************************/
// Seed random number generator
srandom(UInt32(time(nil)))

/********************************************************************************
| 1. Define a swap function to swap, in-place, two elements of an integer array
|    of arbitrary size
********************************************************************************/


/********************************************************************************
| 2. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the BUBBLE SORT algorithm.
********************************************************************************/


/********************************************************************************
| 3. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the INSERTION SORT algorithm.
********************************************************************************/


/********************************************************************************
| 4. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the SELECTION SORT algorithm.
********************************************************************************/


/********************************************************************************
| 5. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the MERGE SORT algorithm.
********************************************************************************/


/********************************************************************************
| 6.  Define a function which returns a new array of integers.
|     The first parameter should be the size of the array.
|     The second parameter is an enum indicating the Orderness of the array
|     The function should return a new array of integers ordered as specified
|     That is, in the case an "ascending" orderness, the array should be ordered
|          in strictly ascending order
|     In the case of a "descending" orderness, the array should be ordered in
|          strictly descending order
|     In the case of a "random" orderness, the array should be ordered in a
|          random order
|     In ALL CASES the actual numbers used must be derived from a random function
********************************************************************************/




/********************************************************************************
| 9.  Prompt through standard output a menu where the user selects a sort
|     algorithm through standard input, protecting against invalid input: 
|     1) Bubble sort, 2) Insertion sort, 3) Selection sort, 4) Merge sort
|     Then, prompt the user for the size of the array
|     Then, prompt the user for orderness:  
|     1) ascending, 2) descending, 3) random
|     If the user selected a random sort, the range of randmom numbers must be
|     at least twice the size of the array
|
|     Finally:
|       Create the array of the specified size and orderness
|       Print the array prior to sorting
|       Sort the array using the specified algorithm
|       Print the sorted array
|
********************************************************************************/
