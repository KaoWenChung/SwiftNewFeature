/*
 
 Reference: https://www.donnywals.com/what-is-the-some-keyword-in-swift/
 
 What is the “some” keyword in Swift?
 
 We can use keyword "some" as subtype of specific type
 
 ex.
 
 struct Toy: Item {
    let name: String
 }
 
 func createItem() -> some Item {
 return Toy(name: "car")
 }
 
 We return something that conforms to the specific type.
 The returned object’s associated type matches any requirements that are set by the specific type.
 We always return the same type from this function
 
 */

protocol DogType {
    func woof()
}

struct Hoskey: DogType {
    func woof() {
        print("Wooooo")
    }
}

struct Dachshund: DogType {
    func woof() {
        print("Woof")
    }
}

class DogFactory {
    static func adapt() -> some DogType {
        return Dachshund()
    }
}

// It just like associatedtype
protocol DogFactoryType {
    associatedtype Dog: DogType
    func create() -> Dog
}

DogFactory.adapt().woof()

let string = ["testtestt", "2","23", "234"]
print( string[1])
