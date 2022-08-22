// TASK 1: Clamped Number
// Clamp the score between 0 - 100

// Definition Clamped
@propertyWrapper
struct ClampedScore {
    
    private var value: Int = 0

    var wrappedValue: Int {
        get { value }
        set {
            value =
            newValue < 0 ? 0 :
            newValue > 100 ? 100 :
            newValue
        }
    }
}

import Foundation
// TASK 2: Trimmed String
// Trim white space of string

// Definition
@propertyWrapper
struct TrimmedString {
    private var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            value = newValue.trimmingCharacters(in: .whitespaces)
        }
    }
}

//@propertyWrapper
//struct UnitInterval<Value: FloatingPoint> {
//    @ClampedScore
//}

struct Student {
    @TrimmedString var id: String
    @ClampedScore var score: Int
}

// Should be 100
var tom: Student = Student()
tom.score = 120
print(tom.score)

// Should be 0
tom.score = -100
print(tom.score)

// Should be 60
tom.score = 60
print(tom.score)

// Should be tom12211
tom.id = "  tom12211 "
print(tom.id)
