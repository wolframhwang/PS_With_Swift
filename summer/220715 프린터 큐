// BOJ 1966 프린터 큐

import Foundation

let tests = Int(readLine()!)!

var results = [Int]()

for _ in 0..<tests {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let size = input[0]
    let target = input[1]
    
    var queue: [(idx: Int, priority: Int)] = []
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    for i in 0..<size {
        queue.append((idx: i, priority: line[i]))
    }
    
    let result = getPrint(target, &queue)
    results.append(result)
}

results.forEach { print($0) }

func getPrint(_ target: Int, _ queue: inout [(idx: Int, priority: Int)]) -> Int {
    var printedAt = 0
    while !queue.isEmpty {
        let most = queue.max { $0.priority < $1.priority }
        let max = most!.priority
        
        if queue[0].priority < max {
            queue.append(queue[0])
            queue.removeFirst()
        } else {
            if queue[0].idx == target {
                printedAt += 1
                break
            } else {
                printedAt += 1
                queue.removeFirst()
            }
        }
    }
    return printedAt
}
