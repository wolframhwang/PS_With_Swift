let RC = readLine()!.split(separator: " ").map { Int($0)! }
let R = RC[0], C = RC[1]
let dx = [-1,0,1]
let dy = [1,1,1]
var map: [[Character]] = []
var visit: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: C), count: R)
for _ in 0..<R {
    let str = readLine()!
    map.append([])
    let idx = map.count - 1
    for c in str {
        map[idx].append(c)
    }
}

func recur(_ x: Int, _ y: Int) -> Bool {
    visit[x][y] = true
    if y == C - 1 { return true }
    for i in 0..<3 {
        let nx = x + dx[i], ny = y + dy[i]
        if nx < 0 || nx >= R || ny < 0 || ny >= C { continue }
        if visit[nx][ny] { continue }
        if map[nx][ny] == "x" { continue }
        let isCanBeNext = recur(nx, ny)
        if isCanBeNext { return isCanBeNext }
    }
    return false
}
var answer = 0
for i in 0..<R {
    let result = recur(i, 0)
    answer = answer + (result ? 1: 0)
}

print(answer)
