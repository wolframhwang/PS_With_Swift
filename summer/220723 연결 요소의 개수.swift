import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let nodes = input[0]
let edges = input[1]

var graph = Array(repeating: Array(repeating: 0, count: nodes), count: nodes)

for _ in 0..<edges {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let m = input[0] - 1
    let n = input[1] - 1
    graph[m][n] = 1
    graph[n][m] = 1
}

var visited = Array(repeating: false, count: nodes)
var queue = [Int]()
var count = 0

// bfs로 해보기
while visited.contains(false) {
    for i in 0..<nodes {
        if visited[i] == false {
            count += 1
            bfs(i)
        } else {
            continue
        }
    }
}

func bfs(_ node: Int) {
    queue.append(node)
    visited[node] = true
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        for i in 0..<nodes {
            if graph[cur][i] == 1 && visited[i] == false {
                visited[i] = true
                queue.append(i)
            }
        }
    }
}

print(count)
