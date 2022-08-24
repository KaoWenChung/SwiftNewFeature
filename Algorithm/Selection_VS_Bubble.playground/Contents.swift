// Use CFAbsoluteTimeGetCurrent to measure performance

import UIKit
// test fixture
let testArr: [Int] = [10, 8, 9, 2, 4, 6, 1]

func selectionSort(_ arr: [Int]) {
    let start1 = CFAbsoluteTimeGetCurrent()
    var tempArr: [Int] = arr
    for index in tempArr.indices {
        var minNumIndex: Int = index
        for _index in index...tempArr.count - 1 {
            if tempArr[minNumIndex] > tempArr[_index] {
                minNumIndex = _index
            }
        }
        let tempTuple: (origin: Int, min: Int) = (tempArr[index], tempArr[minNumIndex])
        tempArr[index] = tempTuple.min
        tempArr[minNumIndex] = tempTuple.origin
    }
    print("Answer: ", tempArr)
    let diff1 = CFAbsoluteTimeGetCurrent() - start1
    print("Took \(diff1) seconds")
}


func bubbleSort(_ input: [Int]) {
    let start2 = CFAbsoluteTimeGetCurrent()
    var tempArr: [Int] = input
    var length: Int = input.count
    while length >= 2 {
        for index in 0 ... length - 2 {
            let tempTuple: (Int, Int)
            if tempArr[index] > tempArr[index + 1] {
                tempTuple = (tempArr[index + 1], tempArr[index])
            } else {
                tempTuple = (tempArr[index], tempArr[index + 1])
            }
            tempArr[index] = tempTuple.0
            tempArr[index + 1] = tempTuple.1
        }
        length -= 1
    }
    print("Answer: ", tempArr)
    let diff2 = CFAbsoluteTimeGetCurrent() - start2
    print("Took \(diff2) seconds")
}

for _ in 0...10 {
    bubbleSort(testArr)
}
