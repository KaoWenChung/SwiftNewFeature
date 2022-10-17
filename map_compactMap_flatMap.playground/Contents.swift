
let textStringList: [String] = ["Aaa","Bbb","Ccc"]
let numberStringList: [String] = ["1","2","3"]
let numberList = [1,2,3]
let mixNumberTextStringList = ["Aaa", "1", "Bbb", "2", "Ccc", "3"]
let nestedStringList = [["Aaa", "Bbb", "Ccc"], ["Aaa", "Bbb"], ["Aaa"]]

// MARK: - map()
print("Here comes to map")
// Upcase every element of stringTextList
print(textStringList.map {$0.uppercased()})

// Transform every element type in stringTextList
print(numberStringList.map { Int($0) })

// Multiply every element in numberList
print(numberList.map {$0 * 2})

// Transform every element type in mixNumberTextStringList
print(mixNumberTextStringList.map { Int($0) })

// MARK: - compactMap()
print("\nHere comes to comactMap")
// Upcase every element of stringTextList
print(textStringList.compactMap {$0.uppercased()})

// Transform every element type in stringTextList
print(numberStringList.compactMap { Int($0) })

// Multiply every element in numberList
print(numberList.compactMap {$0 * 2})

// Transform every element type in mixNumberTextStringList
print(mixNumberTextStringList.compactMap { Int($0) })

// MARK: - flatMap()
print("\nHere comes to flatMap")
// Upcase every element of stringTextList
print(nestedStringList.flatMap {$0})

