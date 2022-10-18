// Resource: https://youtu.be/uRLcV2Rvheg

import UIKit

let queue = DispatchQueue.global()
let group = DispatchGroup()

// MARK: - group.wait()
/*
queue.async(group: group) {
    sleep(3)
    
    print("Task 1 is done")
}

queue.async(group: group) {
    sleep(1)
    
    print("Task 2 is done")
}

group.wait()
print("All tasks done")
print("Continue Execution")
*/

// MARK: - group enter/ leave/ notify
group.enter()
queue.async(group: group) {
    sleep(3)
    print("Task 1 is done")
    group.leave()
}

queue.async(group: group) {
    sleep(1)
    print("Task 2 is done")
    group.leave()
}

group.notify(queue: queue) {
    print("All tasks done")
}

print("Continue Execution")
