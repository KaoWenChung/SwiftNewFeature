/*
 Resource: https://docs.swift.org/swift-book/LanguageGuide/ErrorHandling.html
 */

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

func canThrowError() throws {}

func cannotThrowError() {}

struct Item {
    var count: Int
    var price: Int
}

class VendingMachine {
    private var inventory = [
        "Candy": Item(count: 7, price: 10),
        "Chips": Item(count: 10, price: 15),
        "Chocolate": Item(count: 20, price: 9)
    ]

    var coinsDeposited = 0

    func vend(itemName name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price
        inventory[name]?.count -= 1
        
        print("Dispensing", name)
    }
}

let favoriteSnacks = [
    "Andy": "Cola Candy",
    "Ben": "Candy",
    "Chloe": "Chips"
]

func buyFavoriteFood(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Cookie"
    try vendingMachine.vend(itemName: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        self.name = name
        try vendingMachine.vend(itemName: name)
    }
}

/*
 do {
     try expression
     statements
 } catch pattern 1 {
     statements
 } catch pattern 2 where condition {
     statements
 } catch pattern 3, pattern 4 where condition {
     statements
 } catch {
     statements
 }
 */
let greenVendingMachine = VendingMachine()

greenVendingMachine.coinsDeposited = 10

do {
    try buyFavoriteFood(person: "Andy", vendingMachine: greenVendingMachine)
    print("Andy got it, awesome!")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection!")
} catch VendingMachineError.outOfStock {
    print("There is out of stock!")
} catch VendingMachineError.insufficientFunds(coinsNeeded: let coinsNeeded) {
    print("Insufficient funds, please add additional\(coinsNeeded) coins")
} catch {
    print("Unexpected error!")
}

class Node {
  let data: AnyObject
  var nextNode: Node?
  init(data: AnyObject) {
    self.data = data
  }
}
