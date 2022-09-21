/*
 OptionSet is quite similar to Enum, you can select more than one with OptionSet
 */

struct CustomBurger: OptionSet {
    let rawValue: Int
    
    static let cheese = CustomBurger(rawValue: 1 << 0)
    static let egg = CustomBurger(rawValue: 1 << 1)
    static let beef = CustomBurger(rawValue: 1 << 2)
    static let chicken = CustomBurger(rawValue: 1 << 3)
    static let lettuce = CustomBurger(rawValue: 1 << 4)
    static let all: CustomBurger = [.cheese, .egg, .beef, .chicken, .lettuce]
}

// How to use it?
let chickenBurger: CustomBurger = [.egg, .lettuce, .chicken]

print(chickenBurger)

if chickenBurger.contains(.chicken) {
    print("This burger contains chicken!")
}

let basicCheeseBurger: CustomBurger = [.cheese, .beef, .lettuce]

print(basicCheeseBurger)
// Shouldn't be worked
if basicCheeseBurger.contains(.chicken) {
    print("BasicCheeseBurger contains chicken?!")
}

let massiveBurger: CustomBurger = CustomBurger.all
print(massiveBurger)
