let dx = [0,0,1,-1], dy = [1,-1,0,0]
let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
var NurbE = N * M

var map: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var candidate: [(x: Int, y: Int)] = []
var virusInital: [(x: Int, y: Int)] = []
var wall: [(x: Int, y: Int)] = [(0, 0), (0, 0), (0, 0)]
var answer = -1, cnt = 1

var visit = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 2 { 
            virusInital.append((i, j))
            NurbE -= 1
        }
        else if map[i][j] == 1 {
            NurbE -= 1
        }
        else if map[i][j] == 0 {
            candidate.append((i, j))
        }
    }
}

recur(0, 0)
print(answer)

func bfs() -> Int {
    var area = NurbE
    var q: [(x: Int, y: Int)] = []
    var front = 0
    for w in wall {
        visit[w.x][w.y] = cnt
        area -= 1
    }
    for cand in virusInital {
        q.append(cand)
        visit[cand.x][cand.y] = cnt
    }
    while q.count != front {
        let now = q[front]
        front += 1

        for i in 0..<4 {
            let nx = now.x + dx[i], ny = now.y + dy[i]
            if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
            if visit[nx][ny] == cnt { continue }
            if map[nx][ny] != 0 { continue }
            q.append((nx, ny))
            visit[nx][ny] = cnt
            area -= 1
        }
    }

    return area
}

func recur(_ idx: Int, _ count: Int) {
    if count == 3 {
        let safeArea = bfs()
        answer = max(answer, safeArea)
        cnt += 1
        return
    }
    if idx  >= candidate.count {
        return
    }
    wall[count] = candidate[idx]
    recur(idx + 1, count + 1)
    wall[count] = (0, 0)

    recur(idx + 1, count)
}
