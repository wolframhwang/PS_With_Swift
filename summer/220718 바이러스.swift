// BOJ 2606 바이러스

import Foundation

let vertice = Int(readLine()!)!
let edges = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: vertice + 1)

for _ in 0..<edges {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

var infected = 0
var queue = [Int]()
var visited = Array(repeating: false, count: vertice + 1)

func bfs(_ idx: Int) {
    visited[idx] = true
    
    for vertex in graph[idx] {
        if !visited[vertex], !queue.contains(vertex) {
            queue.append(vertex)
            infected += 1
        }
    }
    
    if !queue.isEmpty {
        bfs(queue.removeFirst())
    } else {
        return
    }
}

bfs(1)

print(infected)
