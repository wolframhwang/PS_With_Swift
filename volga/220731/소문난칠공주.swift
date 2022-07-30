var map: [[Character]] = []
var visit: [Bool] = [Bool](repeating: false, count: (1 << 25))
var Rcnt = 0
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

for _ in 0..<5 {
    map.append(Array( readLine()!))
}
func recur(_ cnt: Int, _ s: Int, _ path: Int) {
    visit[path] = true
    if cnt == 7 {
        if s >= 4 {
            Rcnt += 1
        }
        return
    }
    for i in 0..<5 {
        for j in 0..<5 {
            if (path & (1 << (i * 5 + j))) == 0 { continue }
            else {
                for k in 0..<4 {
                    let nx = i + dx[k],ny = j + dy[k]
                    if nx > 4 || nx < 0 || ny > 4 || ny < 0 { continue }
                    if (path & (1 << (nx * 5 + ny)) != 0) || visit[path | (1 << (nx * 5 + ny))] { continue }
                    else {
                        recur(cnt + 1,
                              (s + (map[nx][ny] == "S" ? 1: 0)),
                              (path | (1 << (nx * 5 + ny))))
                    }
                }
            }
        }
    }
}
for i in 0..<5 {
    for j in 0..<5 {
        recur(1, map[i][j] == "S" ? 1: 0, 1 << (i * 5 + j))
    }
}
print(Rcnt)
