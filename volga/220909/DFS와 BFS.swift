let NMV = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMV[0], M = NMV[1], V = NMV[2]

var map = [[Int]](repeating: [], count: N + 1)

for _ in 0..<M {
    let AB = readLine()!.split(separator: " ").map { Int($0)! }
    map[AB[0]].append(AB[1])
    map[AB[1]].append(AB[0])
}

for i in 0..<map.count {
    map[i].sort()
}

var visit = [Bool](repeating: false, count: N + 1)

func dfs(_ now: Int, _ visit: inout [Bool], _ map: inout [[Int]]) {
    print(now, terminator: " ")
    visit[now] = true
    for next in map[now] {
        if visit[next] { continue }
        dfs(next, &visit, &map)
    }
}

func bfs(_ map: inout [[Int]]) {
    var visit = [Bool](repeating: false, count: N + 1)
    var q: [Int] = [V]
    var front = 0
    visit[V] = true
    
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

dfs(V, &visit, &map)
print()
bfs(&map)
