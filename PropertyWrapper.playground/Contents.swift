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

// TASK 2: Trimmed String
// Trim white space of string

import Foundation // String trimmingCharacters methods
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

// 💪 TEST
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

/*------------------------------------------------------------------------*/
// source: https://lochiwei.gitbook.io/ios/swift/protocols/comparable/.clamped-in
// Definition
// 🌀 Comparable + .clamped(in:)
extension Comparable {

    /// ⭐️ clamp a `Comparable` in a `ClosedRange` (lowerBound...upperBound).
    /// ```
    /// 3.clamped(in: 5...8)  // 5
    /// 6.clamped(in: 5...8)  // 6
    /// 9.clamped(in: 5...8)  // 8
    /// ```
    public func clamped(in range: ClosedRange<Self>) -> Self {
        min(max(self, range.lowerBound), range.upperBound)
    }
    
    /// ⭐️ clamp a `Comparable` in a `PartialRangeFrom` (lowerBound...).
    /// ```
    /// 3.clamped(in: 5...)        // 5
    /// 6.clamped(in: 5...)        // 6
    /// 9.clamped(in: 5...)        // 9
    /// Int.min.clamped(in: 5...)  // 5
    /// Int.max.clamped(in: 5...)  // 9223372036854775807
    /// ```
    public func clamped(in range: PartialRangeFrom<Self>) -> Self {
        range.contains(self) ? self : range.lowerBound
    }
    
    /// ⭐️ clamp a `Comparable` in a `PartialRangeThrough` (...upperBound).
    /// ```
    /// 3.clamped(in: ...8)        // 3
    /// 6.clamped(in: ...8)        // 6
    /// 9.clamped(in: ...8)        // 8
    /// Int.min.clamped(in: ...8)  // -9223372036854775808
    /// Int.max.clamped(in: ...8)  // 8
    /// ```
    public func clamped(in range: PartialRangeThrough<Self>) -> Self {
        range.contains(self) ? self : range.upperBound
    }
}
// Definition
// Clamp a comparable type value in a range
@propertyWrapper
struct Clamped<T: Comparable> {
    private var value: T
    private let range: ClosedRange<T>
    
    init(wrappedValue: T, in range: ClosedRange<T>) {
        self.value = wrappedValue.clamped(in: range)
        self.range = range
    }

    var wrappedValue: T {
        get { value }
        set { value = newValue.clamped(in: range) }
    }
}
// High lavel of Clamped
// Clamp a float in the range between 0 - 1
@propertyWrapper
struct UnitInterval<Value: FloatingPoint> {
    @Clamped(in: 0...1)
    var wrappedValue: Value = .zero

    init(wrappedValue: Value = .zero) {
        self.wrappedValue = wrappedValue
    }
}

// 💪 TEST
struct RGB {
    @UnitInterval var red: Double = 0
    @UnitInterval var green: Double = 0
    @UnitInterval var blue: Double = 0
}

let skyBlue = RGB(red: 0.321, green: 0.512, blue: 0.924)
let white = RGB(red: 3, green: 5, blue: 2)
let black = RGB()

// Should be 0.321 1.0 0.0
print(skyBlue.red, white.blue, black.red)
