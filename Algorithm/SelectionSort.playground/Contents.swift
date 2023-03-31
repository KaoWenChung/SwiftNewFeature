func selectionSort(_ arr: [Int]) -> [Int] {
    var tempArr: [Int] = arr
    for index in tempArr.indices {
        var minNumIndex: Int = index
        for _index in index...tempArr.count - 1 {
            if tempArr[minNumIndex] > tempArr[_index] {
                minNumIndex = _index
            }
        }
        tempArr.swapAt(index, minNumIndex)
    }
    return tempArr
}

let testA = [1,2,3,4,5]
print("\(testA) =>", selectionSort(testA))

let testB = [5,4,3,2,1]
print("\(testB) =>", selectionSort(testB))

let testC = [8,4,2,2,1,7]
print("\(testC) =>", selectionSort(testC))
