let NMV = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMV[0], M = NMV[1], V = NMV[2]

var map: [[Int]] = [[Int]](repeating: [], count: N + 1)

for _ in 0..<M {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    map[ab[0]].append(ab[1])
    map[ab[1]].append(ab[0])
}

for i in 1...N {
    map[i].sort()
}

var visit: [Bool] = [Bool](repeating: false, count: N + 1)

func bfs(_ start: Int) {
    visit = [Bool](repeating: false, count: N + 1)
    visit[start] = true
    var q: [Int] = [start]
    var front = 0
    
    while q.count != front {
        let now = q[front]
        print(now, terminator: " ")
        front += 1
        for next in map[now] {
            if visit[next] { continue }
            visit[next] = true
            q.append(next)
        }
    }
}

func dfs(_ start: Int) {
    visit[start] = true
    print(start, terminator: " ")
    for next in map[start] {
        if visit[next] { continue }
        visit[next] = true
        dfs(next)
    }
}


dfs(V)
print()
bfs(V)
