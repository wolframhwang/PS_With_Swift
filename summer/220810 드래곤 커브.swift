import Foundation

let size = readLine()!.split(separator: " ").map { Int($0)! }
let n = size[0]
let m = size[1]

let input = readLine()!.split(separator: " ").map { Int($0)! }
let startr = input[0]
let startc = input[1]
let startd = input[2]

var map = Array(repeating: [Int](), count: n)
for i in 0..<n {
    map[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
}

var visited = Array(repeating: Array(repeating: false, count: m), count: n)

var answer = 0

// 보고있는 방향: N E S W
let dr = [-1, 0, 1, 0]
let dc = [0, 1, 0, -1]
var rot = 0
func recur(_ x: Int, _ y: Int, _ d: Int) {
    if visited[x][y] == false {
        answer += 1
        visited[x][y] = true
    }
    
    var rot = 0
    for i in 0..<4 {
        let nd = (d + 3 - i) % 4
        
        let nx = x + dr[nd]
        let ny = y + dc[nd]
        
        if map[nx][ny] == 1 || visited[nx][ny] {
            rot += 1
            continue
        } else {
            recur(nx, ny, nd)
            break
        }
    }
    
    if rot == 4 {
        var bd = d + 2
        if bd > 3 { bd -= 4 }
        let nx = x + dr[bd]
        let ny = y + dc[bd]
        
        if map[nx][ny] == 1 { return }
        recur(nx, ny, d)
    }
}

recur(startr, startc, startd)
print(answer)
