let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]

var map = [[Int]](repeating: [], count: N + 1)
var visit = [Bool](repeating: false, count: N + 1)
for _ in 0..<M {
    let uv = readLine()!.split(separator: " ").map { Int($0)! }
    map[uv[0]].append(uv[1])
    map[uv[1]].append(uv[0])
}

func bfs(_ node: Int) {
    var q = [node]
    var front = 0
    visit[node] = true
    
    while q.count != front {
        let now = q[front]
        front += 1
        
        for next in map[now] {
            if visit[next] { continue }
            visit[next] = true
            q.append(next)
        }
    }
}

var answer = 0

for i in 1...N {
    if !visit[i] {
        bfs(i)
        answer += 1
    }
}

print(answer)
