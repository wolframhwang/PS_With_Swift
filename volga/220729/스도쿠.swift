var map:[[Int]] = []

for _ in 0..<9 {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

let line = [Bool](repeating: false, count: 10)
var r: [[Bool]] = [[Bool]](repeating: line, count: 9)
var c: [[Bool]] = [[Bool]](repeating: line, count: 9)
var square = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: 10), count: 3), count: 3)

var candidate: [(x: Int, y: Int)] = []

for i in 0..<9 {
    for j in 0..<9 {
        if map[i][j] == 0 {
            candidate.append((i, j))
        } else {
            r[i][map[i][j]] = true
            c[j][map[i][j]] = true
            square[i / 3][j / 3][map[i][j]] = true
        }
    }
}

let N = candidate.count
var isFind = false
func recur(_ idx: Int) {
    if isFind { return }
    if idx == N {
        for i in 0..<9 {
            for j in 0..<9 {
                print(map[i][j], terminator: " ")
            }
            print()
        }
        isFind = true
        return
    }
    let x = candidate[idx].x, y = candidate[idx].y, xx = x / 3, yy = y / 3
    for i in 1...9 {
        if r[x][i] { continue }
        if c[y][i] { continue }
        if square[xx][yy][i] { continue }
        r[x][i] = true
        c[y][i] = true
        square[xx][yy][i] = true
        map[x][y] = i
        recur(idx + 1)
        map[x][y] = 0
        square[xx][yy][i] = false
        r[x][i] = false
        c[y][i] = false
    }
}

recur(0)
