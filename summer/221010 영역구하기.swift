let input = readLine()!.split(separator: " ").map { Int($0)! }
let row = input[0]
let col = input[1]
let k = input[2]

// (0,2) (4,4)

/*
 0 0 0 0 0
 0 0 0 0 0
 1 1 1 1 0
 1 1 1 1 0
 0 0 0 0 0
 */

var map = Array(repeating: Array(repeating: 0, count: col), count: row)

for _ in 0..<k {
    let rec = readLine()!.split(separator: " ").map { Int($0)! }
    let colS = rec[0], rowS = rec[1], colE = rec[2], rowE = rec[3]
    
    for i in rowS..<rowE {
        for j in colS..<colE {
            map[i][j] = 1
        }
    }
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]
var visited = Array(repeating: Array(repeating: false, count: col), count: row)
var answer = 0
var area: [Int] = []
var cur = 0

for i in 0..<row {
    for j in 0..<col {
        if visited[i][j] { continue }
        if map[i][j] == 1 { continue }
        sol(i, j)
        answer += 1
        area.append(cur)
        cur = 0
    }
}

func sol(_ x: Int, _ y: Int) {
    visited[x][y] = true
    if map[x][y] == 1 { return }
    cur += 1
    
    for i in 0..<4 {
        let dx = x + dx[i]
        let dy = y + dy[i]
        
        if dx < 0 || dx >= row || dy < 0 || dy >= col { continue }
        if map[dx][dy] == 1 { continue }
        if visited[dx][dy] { continue }
        sol(dx, dy)
    }
}

sol(0, 0)

print(answer)
area.sorted().forEach { print($0, terminator: " ")}
