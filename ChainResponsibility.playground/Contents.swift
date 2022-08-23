// Resource: https://refactoring.guru/design-patterns/chain-of-responsibility/swift/example
protocol Handler: AnyObject {
    
    /*
     return a hander from here will let us link handlers in a convenient way like this:
     monkey.setNext(handler: squirrel).setNext(handler: dog)
     */
    @discardableResult
    func setNext(handler: Handler) -> Handler

    func handle(request: String) -> String?
    
    var nextHandler: Handler? { get set }
}

extension Handler {

    func setNext(handler: Handler) -> Handler {
        self.nextHandler = handler
        
        /*
         return a hander from here will let us link handlers in a convenient way like this:
         monkey.setNext(handler: squirrel).setNext(handler: dog)
         */
        return handler
    }

    func handle(request: String) -> String? {
        return nextHandler?.handle(request: request)
    }
}

class MonkeyHandler: Handler {

    var nextHandler: Handler?

    func handle(request: String) -> String? {
        if request == "Banana" {
            return "Monkey: I'll eat this \(request)."
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class SquirrelHandler: Handler {

    var nextHandler: Handler?

    func handle(request: String) -> String? {
        if request == "Nut" {
            return "Squirrel: I'll eat this \(request)."
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class DogHandler: Handler {

    var nextHandler: Handler?

    func handler(request: String) -> String? {
        if request == "Meat" {
            return "Dog: I'll eat this \(request)."
        } else {
            return nextHandler?.handle(request: request)
        }
    }
}

class Client {
    static func someClientCode(handler: Handler) {

        let food: [String] = ["Nut", "Banana", "Chocolate"]

        for item in food {

            print("Client: Who wants a \(item)?")

            guard let result = handler.handle(request: item) else {
                print(item, "was left untouched.")
                return
            }
            print(result)
        }
    }
}

let monkey: MonkeyHandler = MonkeyHandler()
let squirrel: SquirrelHandler = SquirrelHandler()
let dog: DogHandler = DogHandler()

monkey.setNext(handler: squirrel).setNext(handler: dog)

print("Chain: Monkey > Squirrel > Dog")
Client.someClientCode(handler: monkey)

print("CHain: Squirrel > Dog")
Client.someClientCode(handler: squirrel)
