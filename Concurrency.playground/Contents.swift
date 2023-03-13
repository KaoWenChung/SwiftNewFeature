// await async

import UIKit

enum Result<Value> {

    case success(Value)
    case failure(Error)

}

enum RepositoryError: Error {
    case noData
}

class ViewController {
    let viewModel = ViewMdoel()
    func viewDidLoad() {
        print("Test 1")
        Task.init() {
            do {
                let data = try await viewModel.fetchData()
                print("You have gotten", data)
            } catch {
                print("You encounter an error:", error)
            }
            
        }
        print("Test 2")
    }
}

class ViewMdoel {

    func fetchData() async throws -> String {
        // throw Error
//        throw RepositoryError.noData
        // Success
        let data = try await Repository.fetchData()
        return data
    }
}

class Repository {
    class func fetchData() async throws -> String {
        // Mock request time
        sleep(1)
        return "Data"
    }
}
ViewController().viewDidLoad()
