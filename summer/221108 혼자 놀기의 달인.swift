import Foundation

var count: Int = 0
var visited: [Bool] = []
var copy: [Int] = []
var groups: [(group: [Int], count: Int)] = []

func solution(_ cards:[Int]) -> Int {
    copy = cards
    visited = Array(repeating: false, count: cards.count)
    count = cards.count
    
    for i in 0..<cards.count {
        if visited[i] { continue }
        solve(i)
    }
    
    groups.sort { $0.count > $1.count }
    if groups.count == 1 { return 0 }
    return groups[0].count * groups[1].count
}

func solve(_ start: Int) {
    var queue: [Int] = [] // index들을 담는 배열
    queue.append(start)
    visited[start] = true
    var head: Int = 0
    var opened: Int = 1
    
    while head != queue.count {
        let now = queue[head]
        head += 1
        
        if visited[copy[now] - 1] { continue }
        queue.append(copy[now] - 1)
        visited[copy[now] - 1] = true
        opened += 1
    }
    
    groups.append((queue, opened))
}
