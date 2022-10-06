let dx = [0,0,1,-1]
let dy = [1,-1,0,0]
let RC = readLine()!.split(separator: " ").map{ Int($0)! }
let R = RC[0], C = RC[1]

var map: [[Character]] = []
var sheep = 0, wolf = 0

for _ in 0..<R {
    let mapLine = readLine()!
    map.append([])
    mapLine.forEach { c in
        map[map.count - 1].append(c)
    }
}

var visit = [[Bool]](repeating: [Bool](repeating: false, count: map[0].count), count: map.count)
let N = visit.count, M = visit[0].count
for i in 0..<map.count {
    for j in 0..<map[i].count { 
        if map[i][j] != "#", visit[i][j] == false {
            bfs(i, j)
        }
    }
}

func bfs(_ x: Int, _ y: Int) {
    var s = map[x][y] == "o" ? 1: 0, w = map[x][y] == "v" ? 1: 0
    var q: [(x: Int, y: Int)] = [(x, y)]
    var front = 0
    visit[x][y] = true

    while q.count != front {
        let now = q[front]
        front += 1

        for i in 0..<4 {
            let nx = now.x + dx[i], ny = now.y + dy[i]
            if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
            if visit[nx][ny] { continue }
            if map[nx][ny] == "#" { continue }
            if map[nx][ny] == "o" { s += 1 }
            if map[nx][ny] == "v" { w += 1 }
            q.append((nx, ny))
            visit[nx][ny] = true
        }
    }
    if s > w { sheep += s }
    else { wolf += w }
}

print("\(sheep) \(wolf)")
