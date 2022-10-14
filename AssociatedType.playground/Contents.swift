/*
// Reference: https://www.avanderlee.com/swift/associated-types-protocols/#what-is-an-associated-type
 
What is an associated type?

An associated type can be seen as a replacement of a specific type within a protocol definition. In other words: it’s a placeholder name of a type to use until the protocol is adopted and the exact type is specified.
*/

// This is a protocl for String type collection
protocol StringCollectionType {
    var count: Int { get }
    subscript(index: Int) -> String { get }
    mutating func append(_ item: String)
}

// This is a protocl for Int type collection
protocol IntCollectionType {
    var count: Int { get }
    subscript(index: Int) -> Int { get }
    mutating func append(_ item: Int)
}

// They look like the same, right? We can improve them by associatedType
protocol Collection {
    associatedtype Item
    var count: Int { get }
    subscript(index: Int) -> Item { get }
    mutating func append(_ item: Item)
}

struct StringCollection: Collection {
    
    private var container: [String] = []

    var count: Int { return container.count }

    subscript(index: Int) -> String {
        return container[index]
    }

    mutating func append(_ item: String) {
        guard !container.contains(item) else { return }
        container.append(item)
    }
}
