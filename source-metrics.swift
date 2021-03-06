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

func reverseArray(array: [Int]) -> [Int] {
    if array.isEmpty { print("Your array is empty!") }
    if (array.count < 2) { print("Your array is too small!") }
    var containerArray: [Int] = [] 
    var arraySize = array.count-1
    while(arraySize >= 0) {
        containerArray.append(array[arraySize])
        arraySize -= 1
    }
    print("Array reversed!")
    return containerArray
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
    //print("! Swapped \(array[firstIndex]) with \(array[secondIndex])!")
    //print("$ Current array state: ", array)
}

/********************************************************************************
| 2. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the BUBBLE SORT algorithm.
********************************************************************************/

func bubbleSort(array: [Int]) -> [Int] {
    var containerArray: [Int] = array
    func sortPass(sortArray: inout [Int]) {
        // sorting code
        for i in 0...sortArray.count-2 {
            if(sortArray[i] > sortArray[i+1]) {
                swapFunc(array: &sortArray, firstIndex: i, secondIndex: i+1)
            }        
        }
    }
    func isAscending(checkArray: [Int]) -> Bool {
        for i in 0...checkArray.count-2 {
            if(checkArray[i] > checkArray[i+1]) {
                //print("$ Array is not sorted!")
                return false // array is not sorted 
            }
        }
        //print("$ Array is sorted!")
        return true // array is sorted

    }
    while(!isAscending(checkArray: containerArray)) {
        sortPass(sortArray: &containerArray)
    }
    return containerArray
    
}

/********************************************************************************
| 3. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the INSERTION SORT algorithm.
********************************************************************************/

func insertionSort(array: [Int]) -> [Int]{
    var containerArray: [Int] = array
    var pointerPos = 1

    func sortPassByPointer(sortArray: inout [Int], pointerPos: Int) {
        for i in 0...sortArray.count-2 {
            if(sortArray[i] > sortArray[i+1]) {
                swapFunc(array: &sortArray, firstIndex: i, secondIndex: i+1)
            }        
        }
    }

    func isAscendingTotal(checkArray: [Int]) -> Bool {
        for i in 0...checkArray.count-2 {
            if(checkArray[i] > checkArray[i+1]) {
                return false // array is not sorted
            }
        }
        return true // array is sorted
    }

    func isAscendingToPointer(checkArray: [Int]) -> Bool {
        for i in 0...pointerPos-1 {
            if(checkArray[i] > checkArray[i+1]) {
                return false // array is not sorted
            }
        }
            return true // array is sorted
        }

    func pointerIncrement(sortArray: inout[Int]) { // also sorts
        if(isAscendingToPointer(checkArray: sortArray)) {
            pointerPos += 1
        } 
    }

    while(!isAscendingTotal(checkArray: containerArray)) {
        pointerIncrement(sortArray: &containerArray)
        sortPassByPointer(sortArray: &containerArray, pointerPos: pointerPos)
    }
    return containerArray
}

/********************************************************************************
| 4. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the SELECTION SORT algorithm.
********************************************************************************/

func selectionSort(array: [Int]) -> [Int] {
    var containerArray = array
    for outer in 0 ... containerArray.count-2 {
        var lowestIndex = outer
        for inner in outer+1 ... containerArray.count-1 {
            if (containerArray[inner] < containerArray[lowestIndex]) {
                lowestIndex = inner
            }
        }
        if outer != lowestIndex {
            swapFunc(array: &containerArray, firstIndex: outer, secondIndex: lowestIndex)
        }
    }
    return containerArray
}

/********************************************************************************
| 5. Define a function to sort an integer array of arbitrary size in ascending order
|    The sole input should be an array of integers.  The input array must not be 
|    altered.
|    The function should return a new, sorted array using the MERGE SORT algorithm.
********************************************************************************/

func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    var sortedArray = [Int]()
    print("")
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        if leftArray[leftIndex] < rightArray[rightIndex] {
            sortedArray.append(leftArray[leftIndex])
            leftIndex += 1
        } else if leftArray[leftIndex] > rightArray[rightIndex] {
            sortedArray.append(rightArray[rightIndex])
            rightIndex += 1
        } else {
            sortedArray.append(leftArray[leftIndex])
            leftIndex += 1
            sortedArray.append(rightArray[rightIndex])
            rightIndex += 1
        }
    }
    while leftIndex < leftArray.count {
        sortedArray.append(leftArray[leftIndex])
        leftIndex += 1
    }
    while rightIndex < rightArray.count {
        sortedArray.append(rightArray[rightIndex])
        rightIndex += 1
    }
    
    return sortedArray
}


func mergeSort(array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    let middleIndex = array.count / 2
    let leftArray = mergeSort(array: Array(array[0..<middleIndex]))
    let rightArray = mergeSort(array: Array(array[middleIndex..<array.count]))
    return merge(leftArray: leftArray, rightArray: rightArray)
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


func newArray(arraySize: Int, order: Int) -> [Int] {
    
    if(order == 1) {
        var ascendingArray: [Int] = []
        for _ in 1...arraySize {
            ascendingArray.append(random(min:0, max:(arraySize*2)))
        }
        return bubbleSort(array: ascendingArray)
    }
    if(order == 2) {
        var descendingArray: [Int] = []
        for _ in 1...arraySize {
            descendingArray.append(random(min:0, max:(arraySize*2)))
        }
        return reverseArray(array: bubbleSort(array: descendingArray)) // reverse this
    }
    if(order == 3) {
        var randomArray: [Int] = []
        for _ in 1...arraySize {
            randomArray.append(random(min:0, max:(arraySize*2)))
        }
        return randomArray
    }
    return [0,0,0]
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
func ui_clearScreen() {
    for _ in 0...70 { print(""); }
}

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
| Command Line 
********************************************************************************/

func writeToFile(pathIn: String, input: String) {
    let pathURL = URL(fileURLWithPath: pathIn)
    do {
        try input.write(to: pathURL, atomically: true, encoding: .utf8)
    } catch (let error) {
        fatalError("Failed to write file because \(error).")
    }
}

func readFile(pathIn: String) -> String { 
    let pathURL = URL(fileURLWithPath: pathIn)
    let readText : String
    do {
        try readText = String(contentsOf: pathURL, encoding: .utf8)
        return readText
    } catch (let error) {
        fatalError("Failed to read file because \(error).")
    }
}

func readArguments() {
    if(CommandLine.arguments[1] == "--write") {
        print("write")
        /*
        if(CommandLine.argc >= 3) {
            var container = ""
            let arguments = CommandLine.arguments
            for i in 2...CommandLine.argc-1 {
                print(arguments[Int(i)])
                container += arguments[Int(i)]
            }
            print(container)
        }*/
        if(CommandLine.argc == 3) {
            let filePath = CommandLine.arguments[2]
            ui_arraySize()
            let input_arraySize = intInput()
            ui_orderness()
            let input_orderness = intInput()   
            print("============================================") // 46 "="
            let randomArray = newArray(arraySize: input_arraySize, order: input_orderness).map(String.init).joined(separator: "|")
                      writeToFile(pathIn: filePath, input: randomArray)
            ui_clearScreen()
        }
        else {
            print("INVALID FILE PATH")
            print("PLEASE USE THIS FORMAT: ")
            print("home/directory/file.example")
            print("WITHOUT ANY SPACES IN THE FILE PATH")
        }
    }
    else if (CommandLine.arguments[1] == "--read" && CommandLine.arguments[3] == "--executeSort") {
        print("execute sort")
        if(CommandLine.argc == 5) {
            let filePath = CommandLine.arguments[2]
            let sortType = CommandLine.arguments[4]
            //ui_openingMenu()
            let arrayToSort = readFile(pathIn: filePath).split(separator:"|").map{ Int($0)!}
            print("============================================") // 46 "="
            print("======       Array to be sorted        =====") 
            print("============================================") // 46 "="
            print("\(arrayToSort)")
            print("============================================") // 46 "="
            print("======          Array sorted           =====") 
            print("============================================") // 46 "="
            switch sortType {
            case "bubble":
                print("Bubble Sort")
                print(bubbleSort(array: arrayToSort))
            case "insertion":
                print("Insertion Sort")
                print(insertionSort(array: arrayToSort))
            case "selection":
                print("Selection Sort")  
                print(selectionSort(array: arrayToSort))
            case "merge":
                print("Merge Sort")   
                print(mergeSort(array: arrayToSort))
            default:
                print("Invalid sort")
            }
        }
        else {
            print("INVALID FILE PATH")
            print("PLEASE USE THIS FORMAT: ")
            print("home/directory/file.example")
            print("WITHOUT ANY SPACES IN THE FILE PATH")
        }
    }
    else if (CommandLine.arguments[1] == "--read" && CommandLine.arguments[3] == "--repeatSort") {
        print("read and repeatSort")
        if(CommandLine.argc == 5) {
            assert(Int(CommandLine.arguments[4]) != nil, "Argument must be an integer")
            let filePath = CommandLine.arguments[2]
            let repeatN = Int(CommandLine.arguments[4])!
            ui_openingMenu()
            var input_sortType = 0
            while(input_sortType < 1 || input_sortType > 4) {
                input_sortType = intInput()
            }
            let arrayToSort = readFile(pathIn: filePath).split(separator:"|").map{ Int($0)!}
            print("============================================") // 46 "="
            print("======       Array to be sorted        =====") 
            print("============================================") // 46 "="
            print("\(arrayToSort)")
            print("============================================") // 46 "="
            print("======          Array sorted           =====") 
            print("============================================") // 46 "="
            for _ in 0...repeatN {
                switch input_sortType {
                case 1:
                    print("Bubble Sort")
                    print(bubbleSort(array: arrayToSort))
                case 2:
                    print("Insertion Sort")
                    print(insertionSort(array: arrayToSort))
                case 3:
                    print("Selection Sort")  
                    print(selectionSort(array: arrayToSort))
                case 4:
                    print("Merge Sort")   
                    print(mergeSort(array: arrayToSort))
                default:
                    print("Invalid sort")
                }
            }
        }
        else {
            print("INVALID FILE PATH")
            print("PLEASE USE THIS FORMAT: ")
            print("home/directory/file.example")
            print("WITHOUT ANY SPACES IN THE FILE PATH")
        }
    }
    else if (CommandLine.arguments[1] == "--read") {
        print("read")
        if(CommandLine.argc == 3) {
            let filePath = CommandLine.arguments[2]
            ui_openingMenu()
            var input_sortType = 0
            while(input_sortType < 1 || input_sortType > 4) {
                input_sortType = intInput()
            }
            let arrayToSort = readFile(pathIn: filePath).split(separator:"|").map{ Int($0)!}
            //print(arrayToSort)

            
            print("============================================") // 46 "="
            print("======       Array to be sorted        =====") 
            print("============================================") // 46 "="
            print("\(arrayToSort)")
            print("============================================") // 46 "="
            print("======          Array sorted           =====") 
            print("============================================") // 46 "="

            switch input_sortType {
            case 1:
                print("Bubble Sort")
                print(bubbleSort(array: arrayToSort))
            case 2:
                print("Insertion Sort")
                print(insertionSort(array: arrayToSort))
            case 3:
                print("Selection Sort")  
                print(selectionSort(array: arrayToSort))
            case 4:
                print("Merge Sort")   
                print(mergeSort(array: arrayToSort))
            default:
                print("Invalid sort")
            }
        }
        else {
            print("INVALID FILE PATH")
            print("PLEASE USE THIS FORMAT: ")
            print("home/directory/file.example")
            print("WITHOUT ANY SPACES IN THE FILE PATH")
        } 
    }  
}


/********************************************************************************
| Execution
********************************************************************************/
var exit = false

// Command Line
if(CommandLine.argc > 1){
    exit = true
    readArguments() 
}
else {
    print("poop")
}

// Options 
if(!exit) {
    ui_openingMenu()
    var input_sortType = 0
    while(input_sortType < 1 || input_sortType > 4) {
        input_sortType = intInput()
    }
    ui_arraySize()
    let input_arraySize = intInput()
    ui_orderness()
    let input_orderness = intInput()   
    print("============================================") // 46 "="
    // Arrays
    let arrayToSort = newArray(arraySize: input_arraySize, order: input_orderness)
    ui_clearScreen()
    print("============================================") // 46 "="
    print("======       Array to be sorted        =====") 
    print("============================================") // 46 "="
    print("\(arrayToSort)")
    print("============================================") // 46 "="
    print("======          Array sorted           =====") 
    print("============================================") // 46 "="

    switch input_sortType {
    case 1:
        print("Bubble Sort")
        print(bubbleSort(array: arrayToSort))
    case 2:
        print("Insertion Sort")
        print(insertionSort(array: arrayToSort))
    case 3:
        print("Selection Sort")  
        print(selectionSort(array: arrayToSort))
    case 4:
        print("Merge Sort")   
        print(mergeSort(array: arrayToSort))
    default:
        print("Invalid sort")
    }
}
