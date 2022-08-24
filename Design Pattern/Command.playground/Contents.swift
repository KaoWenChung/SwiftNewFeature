// Resource: https://refactoring.guru/design-patterns/command/swift/example

// In Command Design Pattern,
// There are three characters in this pattern
// The conversion allows deferred or remote execution of commands, storing command history, etc.
//  - Invoker: Stores and excutes commands
//  - Command: An object that encapsulates action
//  - Receiver: an object acted upon by command


protocol Command {
    func execute()
}

class SimpleCommand: Command {
    
    private let payload: String
    
    init(_ payload: String) {
        self.payload = payload
    }

    func execute() {
        print("SimpleCommand: handle with print:", payload)
    }
}

class ComplexCommand: Command {
    private let receiver: Receiver
    
    private let a: String
    private let b: String
    
    init(_ receiver: Receiver, a: String, b: String) {
        self.receiver = receiver
        self.a = a
        self.b = b
    }
    
    func execute() {
        receiver.handleWith(aTask: a)
        receiver.handleWith(bTask: b)
    }
}

protocol Receiver {
    func handleWith(aTask: String)
    func handleWith(bTask: String)
}

class SimpleReceiver: Receiver {
    
    func handleWith(aTask: String) {
        print("SimpleReceiver handle with", aTask)
    }
    
    func handleWith(bTask: String) {
        print("SimpleReceiver handle with", bTask)
    }
    
}

class Invoker {

    private var onStart: Command?
    private var onFinish: Command?

    func setOnStart(_ command: Command) {
        onStart = command
    }

    func setOnFinish(_ command: Command) {
        onFinish = command
    }

    func executeTask() {
        print("Invoker execute onStart")
        onStart?.execute()
        print("Invoker execute onFinish")
        onFinish?.execute()
    }
}

let invoker: Invoker = Invoker()
invoker.setOnStart(SimpleCommand("Hello!!"))

let receiver: SimpleReceiver = SimpleReceiver()
invoker.setOnFinish(ComplexCommand(receiver, a: "Send email", b: "Save report"))
invoker.executeTask()
