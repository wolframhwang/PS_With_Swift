let size = readLine()!.split(separator: " ").map { Int($0)! }
let row: Int = size[0]
let col: Int = size[1]
var totalSheep: Int = 0
var totalWolf: Int = 0

var map = Array(repeating: [Character](), count: row)
for i in 0..<row {
    let input = readLine()!
    map[i].append(contentsOf: input)
}

var visited = Array(repeating: Array(repeating: false, count: col), count: row)
var curSheep: Int = 0
var curWolf: Int = 0

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

for i in 0..<row {
    for j in 0..<col {
        if visited[i][j] { continue }
        sol(i, j)
        if curSheep > curWolf { totalSheep += curSheep }
        else { totalWolf += curWolf }
        curSheep = 0
        curWolf = 0
    }
}

func sol(_ r: Int, _ c: Int) {
    visited[r][c] = true
    if map[r][c] == "#" { return }
    if map[r][c] == "o" { curSheep += 1 }
    if map[r][c] == "v" { curWolf += 1 }

    for i in 0..<4 {
        let nr = r + dr[i]
        let nc = c + dc[i]

        if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
        if visited[nr][nc] { continue }
        sol(nr, nc)
    }
}

print(totalSheep, terminator: " ")
print(totalWolf)
