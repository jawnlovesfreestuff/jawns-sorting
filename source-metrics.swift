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

func intInput() -> Int {
    var a : Int? = nil
    while(a == nil) {
        print("============================================")
        print("Please input an integer: ", terminator: "")
        if let line = readLine() {
            a = Int(line)
        }
        print("============================================")
    }
    return a!
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

func swapFunc(array: inout [Int], firstIndex: Int, secondIndex: Int) {
    if array.isEmpty { print("Your array is empty!") }
    if (array.count < 2) { print("Your array is too small!") }
    let tempArray = array
    array[firstIndex] = tempArray[secondIndex]
    array[secondIndex] = tempArray[firstIndex]
    print("! Swapped \(array[firstIndex]) with \(array[secondIndex])!")
    print("$ Current array state: ", array)
}

/********************************************************************************
| 2. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the BUBBLE SORT algorithm.
********************************************************************************/

func bubbleSort(array: [Int]) -> [Int] {
    var containerArray: [Int] = []
    var totalPasses = 0
    var totalSwaps = 0
    func sortPass(sortArray: inout [Int]) {
        print("============= START OF PASS #\(totalPasses) =============") // 15 "=" 
        print("$ Array before pass: ", sortArray)
        // sorting code
        for i in 0...sortArray.count-2 {
            if(sortArray[i] > sortArray[i+1]) {
                swapFunc(array: &sortArray, firstIndex: i, secondIndex: i+1)
                totalSwaps += 1 // global var
            }        
        }
        totalPasses += 1 // global var
        print("$ Array after pass: ", sortArray)
        print("============================================") // 46 "="
    }
    func isAscending(checkArray: [Int]) -> Bool {
        print("============================================") // 46 "="
        print("! Checking ", checkArray)
        for i in 0...checkArray.count-2 {
            if(checkArray[i] > checkArray[i+1]) {
                print("$ Array is not sorted!")
                return false // array is not sorted
            }

        }
        print("$ Array is sorted!")
        return true // array is sorted

    }
    while(!isAscending(checkArray: containerArray)) {
        sortPass(sortArray: &containerArray)
    }
    if(isAscending) {
        return containerArray
    }
}

/********************************************************************************
| 3. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the INSERTION SORT algorithm.
********************************************************************************/

func insertionSort(array: [Int]) {
    
}

/********************************************************************************
| 4. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the SELECTION SORT algorithm.
********************************************************************************/

func selectionSort(array: [Int]) {
    
}

/********************************************************************************
| 5. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the MERGE SORT algorithm.
********************************************************************************/

func mergeSort(array: [Int]) {
    
}

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


func newArray(arraySize: Int, order: Orderness) -> [Int] {
    
    if(order == 1) {
        var ascendingArray: [Int] = []
        for _ 1...arraySize {
            ascendingArray.append(random(min:0, max:(arraySize*2)))
        }
    }
    if(order == 2) {
        var descendingArray: [Int] = []
        for _ 1...arraySize {
            descendingArray.append(random(min:0, max:(arraySize*2)))
        }
    }
    if(order == 3) {
        var randomArray: [Int] = []
        for _ 1...arraySize {
            randomArray.append(random(min:0, max:(arraySize*2)))
        }
    }
}

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

/********************************************************************************
| UI
********************************************************************************/
func ui_openingMenu() {
    print("============================================") // 46 "="
    print("====== Please select sorting algorithm =====") 
    print("============================================") // 46 "="
    print("======     1. Bubble Sort              =====")
    print("======     2. Insertion Sort           =====")
    print("======     3. Selection Sort           =====")
    print("======     4. Merge Sort               =====")
    print("============================================") // 46 "="
}

func ui_arraySize() {
    print("============================================") // 46 "="
    print("====== Please input the size of array  =====") 
    print("============================================") // 46 "="
}

func ui_orderness() {
    print("============================================") // 46 "="
    print("======   Please select the orderness   =====") 
    print("============================================") // 46 "="
    print("======     1. Ascending                =====")
    print("======     2. Descending               =====")
    print("======     3. Random                   =====")
    print("============================================") // 46 "="
}
/********************************************************************************
| Execution
********************************************************************************/
ui_openingMenu()
var in_sortType = intInput()
ui_arraySize()
var in_arraySize = intInput()
ui_orderness()
var in_orderness = intInput()   
print("============================================") // 46 "="
var arrayToSort = newArray(arraySize: Int, order: in_orderness)
print(arrayToSort)                
                
