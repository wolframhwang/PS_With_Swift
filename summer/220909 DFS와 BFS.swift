// BOJ 1260 DFS와 BFS

let input = readLine()!.split(separator: " ").map { Int($0)! }
let vertice = input[0]
let edge = input[1]
let start = input[2]

var map = Array(repeating: [Int](), count: vertice + 1)
for _ in 0..<edge {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    if !map[line[0]].contains(line[1]) {
        map[line[0]].append(line[1])
    }
    if !map[line[1]].contains(line[0]) {
        map[line[1]].append(line[0])
    }
}

for i in 1...vertice {
    map[i].sort()
}

var dfsArr = [Int]()
var visited = [Bool](repeating: false, count: vertice + 1)
func dfs(_ v: Int) {
    if visited[v] {
        return
    }
    visited[v] = true
    dfsArr.append(v)
    
    for i in 0..<map[v].count {
        dfs(map[v][i])
    }
}

dfs(start)
dfsArr.forEach { print($0, terminator: " ")}
print("")

var bfsArr = [Int]()
visited = [Bool](repeating: false, count: vertice + 1)
func bfs(_ v: Int) {
    bfsArr.append(v)
    visited[v] = true
    var idx = 0
    
    while idx != bfsArr.count {
        let cur = bfsArr[idx]
        for i in 0..<map[cur].count {
            if visited[map[cur][i]] { continue }
            visited[map[cur][i]] = true
            bfsArr.append(map[cur][i])
        }
        idx += 1
    }
}

bfs(start)
bfsArr.forEach { print($0, terminator: " ")}
