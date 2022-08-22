
var map: [[Character]] = []

let dx = [0,0,0,1,-1,1,1,-1,-1]
let dy = [0,1,-1,0,0,1,-1,1,-1]
var dist: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 8), count: 8)
for _ in 0..<8 {
    let line = readLine()!
    map.append([])
    for c in line { map[map.count - 1].append(c) }
}
var wall: [(x: Int, y: Int)] = []
for i in 0..<8 {
    for j in 0..<8 {
        if map[i][j] == "#" {
            wall.append((i, j))
        }
    }
}

for i in 0..<wall.count {
    var x = wall[i].x, y = wall[i].y
    var count = 1
    if dist[x][y] == 0 {
        dist[x][y] = count
    } else {
        dist[x][y] |= 1
    }
    while true {
        x += 1
        if x >= 8 { break }
        dist[x][y] |= (1 << count)
        count += 1
    }
}

var q: [(x: Int, y: Int, v: Int)] = [(7, 0, 0)]
var front = 0
var answer = 0
while q.count != front {
    let x = q[front].x, y = q[front].y, cnt = q[front].v
    front += 1
    if dist[x][y] & (1 << cnt) != 0 { continue }
    if (x == 0 && y == 7) || cnt >= 7 { 
        answer = 1
        break
    }
    for i in 0..<9 {
        let nx = x + dx[i], ny = y + dy[i]
        if nx < 0 || nx >= 8 || ny < 0 || ny >= 8 { continue }
        if dist[nx][ny] & (1 << cnt) != 0 { continue }
        q.append((nx, ny, cnt + 1))
    }
}

print(answer)
