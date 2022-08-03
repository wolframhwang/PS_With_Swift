let MN = readLine()!.split(separator: " ").map { Int($0)! }
let N = MN[1], M = MN[0]

var map: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var candidate: [(x: Int, y: Int)] = [], numOfArea = 0
var visit: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 1 {
            candidate.append((i, j))
            visit[i][j] = true
        }
        if map[i][j] == -1 {
            numOfArea += 1
        }
    }
}

func bfs() -> Int {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var ret = 0, cnt = N * M - numOfArea - candidate.count
    var q: [(x: Int, y: Int)] = candidate
    var front = 0
    
    while q.count != front {
        let  start = front
        for i in start..<q.count {
            let node = q[i]
            front += 1
            
            for j in 0..<4 {
                let nx = node.x + dx[j], ny = node.y + dy[j]
                if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
                if map[nx][ny] == -1 { continue }
                if visit[nx][ny] { continue }
                visit[nx][ny] = true
                q.append((nx, ny))
                cnt -= 1
            }
        }
        ret += 1
    }
    if cnt == 0 {
        return ret - 1
    } else {
        return -1
    }
}

print("\(bfs())")


