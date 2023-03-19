// Binary Search
// Input numbers: 1-100 , searchNumber: 1 number
// Out: 1 Number/ null (The index of the searchNumber in the number array)

// Naive solution
func searchIndex1(_ numbers: [Int], _ searchNumber: Int) -> Int? {
    var minIndex = 0
    var maxIndex = numbers.count - 1
    guard searchNumber <= numbers[maxIndex], searchNumber >= numbers[minIndex] else { return nil }
    var middleIndex = numbers.count / 2
    while numbers[middleIndex] != searchNumber {
        if numbers[middleIndex] > searchNumber {
            maxIndex = middleIndex
        } else if numbers[middleIndex] < searchNumber {
            minIndex = middleIndex
        }
        middleIndex = (minIndex + maxIndex) / 2
        if maxIndex == minIndex + 1 {
            if numbers[minIndex] == searchNumber {
                return minIndex
            } else if numbers[maxIndex] == searchNumber {
                return maxIndex
            } else {
                return nil
            }
        }
    }
    return middleIndex
}

// Better solution
func searchIndex2(_ numbers: [Int], _ targetNumber: Int) -> Int? {
    var leftIndex = 0
    var rightIndex = numbers.count - 1
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        if numbers[middleIndex] == targetNumber {
            return middleIndex
        } else if numbers[middleIndex] > targetNumber {
            rightIndex = middleIndex - 1
        } else {
            leftIndex = middleIndex + 1
        }
    }
    return nil
}

let testNumbers1To10Without4 = [0,1,2,3,5,6,7,8,9,10]
let testNumbers1To10 = [0,1,2,3,4,5,6,7,8,9,10]

// MARK: - Input numbers: testNumbers1To10Without4, target: 4
if let result = searchIndex1(testNumbers1To10Without4, 4) {
    print("searchIndex1:", result)
} else {
    print("searchIndex1: 4 doesn't exist in numbers")
}

if let result = searchIndex2(testNumbers1To10Without4, 4) {
    print("searchIndex2:", result)
} else {
    print("searchIndex2: 4 doesn't exist in numbers")
}

// MARK: - Input numbers: testNumbers1To10Without4, target: 1
if let result = searchIndex1(testNumbers1To10Without4, 1) {
    print("searchIndex1:", result)
} else {
    print("searchIndex1: 1 doesn't exist in numbers")
}

if let result = searchIndex2(testNumbers1To10Without4, 1) {
    print("searchIndex2:", result)
} else {
    print("searchIndex2: 1 doesn't exist in numbers")
}

// MARK: - Input numbers: testNumbers1To10Without4, target: 10
if let result = searchIndex1(testNumbers1To10Without4, 10) {
    print("searchIndex1:", result)
} else {
    print("searchIndex1: 10 doesn't exist in numbers")
}

if let result = searchIndex2(testNumbers1To10Without4, 10) {
    print("searchIndex2:", result)
} else {
    print("searchIndex2: 10 doesn't exist in numbers")
}


// MARK: - Input numbers: testNumbers1To10, target: 4
if let result = searchIndex1(testNumbers1To10, 4) {
    print("searchIndex1:", result)
} else {
    print("searchIndex1: 4 doesn't exist in numbers")
}

if let result = searchIndex2(testNumbers1To10, 4) {
    print("searchIndex2:", result)
} else {
    print("searchIndex2: 4 doesn't exist in numbers")
}

// MARK: - Input numbers: testNumbers1To10, target: 1
if let result = searchIndex1(testNumbers1To10, 1) {
    print("searchIndex1:", result)
} else {
    print("searchIndex1: 1 doesn't exist in numbers")
}

if let result = searchIndex2(testNumbers1To10, 1) {
    print("searchIndex2:", result)
} else {
    print("searchIndex2: 1 doesn't exist in numbers")
}

// MARK: - Input numbers: testNumbers1To10, target: 10
if let result = searchIndex1(testNumbers1To10, 10) {
    print("searchIndex1:", result)
} else {
    print("searchIndex1: 10 doesn't exist in numbers")
}

if let result = searchIndex2(testNumbers1To10, 10) {
    print("searchIndex2:", result)
} else {
    print("searchIndex2: 10 doesn't exist in numbers")
}

// MARK: - Input numbers: testNumbers1To10, target: 0
if let result = searchIndex1(testNumbers1To10, 0) {
    print("searchIndex1:", result)
} else {
    print("searchIndex1: 0 doesn't exist in numbers")
}

if let result = searchIndex2(testNumbers1To10, 0) {
    print("searchIndex2:", result)
} else {
    print("searchIndex2: 0 doesn't exist in numbers")
}
