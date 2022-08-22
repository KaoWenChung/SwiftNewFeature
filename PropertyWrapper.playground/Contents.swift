// Task 1: Clamped Number
// Clamp the score between 0 - 100

// Definition
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

struct Student {
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
