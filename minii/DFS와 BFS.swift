let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0], M = input[1], V = input[2]
var graph = Array(repeating: [Int](), count: N + 1)
var visited = Array(repeating: false, count: N + 1)

for _ in 0..<M {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    graph[line[0]].append(line[1])
    graph[line[1]].append(line[0])
    graph[line[0]].sort()
    graph[line[1]].sort()
}

func dfs(_ index: Int) {
    if visited[index] {
        return
    }
    
    visited[index] = true
    print(index,terminator: " ")
    
    for v in graph[index] {
        dfs(v)
    }
}

func bfs(_ start: Int) {
    var visited: [Int] = []
    var map = [start]
    while !map.isEmpty {
        let first = map.removeFirst()
        if visited.contains(first) { continue }
        visited.append(first)
        
        map += graph[first]
    }
    
    print(visited.map { String($0) }.joined(separator: " "))
    
}

dfs(V)
print()
bfs(V)
