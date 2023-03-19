func selectionSort(_ arr: [Int]) -> [Int] {
    var tempArr: [Int] = arr
    for index in tempArr.indices {
        var minNumIndex: Int = index
        for _index in index...tempArr.count - 1 {
            if tempArr[minNumIndex] > tempArr[_index] {
                minNumIndex = _index
            }
        }
        tempArr.swapAt(tempArr[index], tempArr[minNumIndex])
    }
    return tempArr
}
