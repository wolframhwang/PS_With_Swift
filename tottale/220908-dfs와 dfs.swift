let nmv = readLine()!.split(separator: " ").compactMap{Int($0)}
let n = nmv[0], m = nmv[1], v = nmv[2]
var visited = Array(repeating: false, count: n+1)
var graph: [[Int]] = Array(repeating: [], count: n+1)
var visitedForBfs = Array(repeating: false, count: n+1)
var queue = [Int]()

for _ in 0..<m {
    let con = readLine()!.split(separator: " ").compactMap{ Int($0) }
    graph[con[0]].append(con[1])
    graph[con[1]].append(con[0])
}

graph = graph.map { arr in
    return arr.sorted()
}

func dfs(_ v: Int) {
    visited[v] = true
    print(v, terminator: " ")
    
    for num in graph[v] {
        if !visited[num] {
            dfs(num)
        }
    }
}

func bfs(_ start: Int) {
    queue.append(start)
    visitedForBfs[start] = true
    
    while !queue.isEmpty {
        let v = queue[0]
        print(v, terminator: " ")
        queue.remove(at: 0)

        for num in graph[v] {
            if !visitedForBfs[num] {
                queue.append(num)
                visitedForBfs[num] = true
            }
        }
    }
}

dfs(v)
print()
bfs(v)
