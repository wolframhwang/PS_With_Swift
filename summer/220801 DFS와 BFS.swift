// BOJ 1260 DFS와 BFS

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let nodes = input[0]
let edges = input[1]
let startNode = input[2]

var map = Array(repeating: [Int](), count: nodes + 1)

for _ in 0..<edges {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    let from = edge[0]
    let to = edge[1]
    
    map[from].append(to)
    map[to].append(from)
}

for i in 0...nodes {
    map[i].sort()
}

var visited = Array(repeating: false, count: nodes + 1)
var stack = [Int]()

func dfs(_ node: Int) {
    visited[node] = true
    print(node, terminator: " ")
    
    for i in 0..<map[node].count {
        if visited[map[node][i]] { continue }
        stack.append(map[node][i])
        if !stack.isEmpty {
            dfs(stack.removeLast())
        }
    }
}

dfs(startNode)
print()

var queue = [Int]()
func bfs(_ node: Int) {
    queue.append(node)
    var idx = 0
    
    while idx <= nodes {
        if idx >= queue.count { break }
        let cur = queue[idx]
        for i in 0..<map[cur].count {
            if queue.contains(map[cur][i]) { continue }
            queue.append(map[cur][i])
        }
        idx += 1
    }

    queue.forEach { print($0, terminator: " ")}
}

bfs(startNode)
