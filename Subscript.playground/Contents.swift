// Reference: https://docs.swift.org/swift-book/LanguageGuide/Subscripts.html

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is", threeTimesTable[6]) // six times three is 18
print("eight times three is", threeTimesTable[8]) // eight times three is 24

enum Plant: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    static subscript(index: Int) -> Plant {
        return Plant(rawValue: index) ?? .mercury
    }
}

print(Plant[1]) // mercury
print(Plant[5]) // jupiter
