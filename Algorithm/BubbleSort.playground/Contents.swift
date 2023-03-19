// Naive solution
func bubbleSort(_ array: [Int]) -> [Int] {
    var result: [Int] = array
    var length: Int = array.count
    while length >= 2 {
        for index in 0 ... length - 2 {
            let tempTuple: (Int, Int)
            if result[index] > result[index + 1] {
                tempTuple = (result[index + 1], result[index])
            } else {
                tempTuple = (result[index], result[index + 1])
            }
            result[index] = tempTuple.0
            result[index + 1] = tempTuple.1
        }
        length -= 1
    }
    return result
}

// Better solution
func bubbleSort2(_ array: [Int]) -> [Int] {
    var result = array
    let length = array.count
    for i in 0 ..< length {
        for j in 0 ..< (length - i) - 1 {
            if result[j] > result[j + 1] {
                result.swapAt(j, j + 1)
            }
        }
    }
    return result
}

print(bubbleSort([5,2,45,6]))
print(bubbleSort2([5,2,45,6]))
print(bubbleSort([5,14,6,8,3,2,6,8]))
print(bubbleSort2([5,14,6,8,3,2,6,8]))
