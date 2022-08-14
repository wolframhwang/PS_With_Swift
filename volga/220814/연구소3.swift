let NM = readLine()!.split(separator: " ").map { Int($0)! }
var map: [[Int]] = []
for _ in 0..<NM[0] {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let N = NM[0], M = NM[1], dx = [0,0,1,-1], dy = [1,-1,0,0], INF = -987654321

var candidate: [(x: Int, y: Int)] = []
var virus: [(x: Int, y: Int)] = []
var cnt = 0



for i in 0..<N {
    for j in 0..<N {
        if map[i][j] == 0 {
            cnt += 1
        }
        if map[i][j] == 2 {
            candidate.append((i, j))
        }
    }
}

var answer = -INF

func bfs() -> Int {
    var visit = [[Int]](repeating: [Int](repeating: -1, count: N), count: N)
    var q: [(x: Int, y: Int)] = [], ret = 0
    var count = 0
    for node in virus {
        q.append(node)
        visit[node.x][node.y] = 0
    }
    var front = 0
    
    while front != q.count {
        let now = q[front]
        front += 1
        
        for i in 0..<4 {
            let nx = now.x + dx[i], ny = now.y + dy[i]
            if nx < 0 || nx >= N || ny < 0 || ny >= N { continue }
            if map[nx][ny] == 1 { continue }
            if visit[nx][ny] != -1 { continue }
            visit[nx][ny] = visit[now.x][now.y] + 1
            if map[nx][ny] == 0 {
                ret = max(ret, visit[nx][ny])
            }
            q.append((nx, ny))
            if map[nx][ny] == 0 {
                count += 1
            }
        }
    }
    if cnt == count {
        return ret
    } else {
        return -INF
    }
}

func recur(_ idx: Int) {
    if virus.count == M {
        let spendTime = bfs()
        answer = min(answer, spendTime)
        return
    }
    if idx >= candidate.count {
        return
    }
    virus.append(candidate[idx])
    recur(idx + 1)
    virus.removeLast()
    
    recur(idx + 1)
}

recur(0)

if answer == -INF {
    print(-1)
} else {
    print(answer)
}

