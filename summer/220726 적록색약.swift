// BOJ 10026 적록색약

import Foundation

let limit = Int(readLine()!)!
var map = Array(repeating: [Character](), count: limit)

for i in 0..<limit {
    let line = Array(readLine()!)
    map[i].append(contentsOf: line)
}

let dir = [(x: 0, y: 1), (x: 0, y: -1), (x: 1, y: 0), (x: -1, y: 0)]
var cur = map[0][0]
var countA = 0
var countD = 0
var visited = Array(repeating: Array(repeating: false, count: limit), count: limit)

for i in 0..<limit {
    for j in 0..<limit {
        if visited[i][j] == false {
            cur = map[i][j]
            recurA(i, j)
            countA += 1
        }
    }
}

func recurA(_ x: Int, _ y: Int) {
    visited[x][y] = true
    
    for i in 0..<4 {
        let nx = x + dir[i].x
        let ny = y + dir[i].y
    
        if nx < 0 || nx >= limit || ny < 0 || ny >= limit {
            continue
        }
        
        if visited[nx][ny] == true { continue }

        
        if map[nx][ny] == cur {
            recurA(nx, ny)
        } else {
            continue
        }
    }
}

visited = Array(repeating: Array(repeating: false, count: limit), count: limit)

for i in 0..<limit {
    for j in 0..<limit {
        if visited[i][j] == false {
            cur = map[i][j]
            recurD(i, j)
            countD += 1
        }
    }
}

func recurD(_ x: Int, _ y: Int) {
    visited[x][y] = true
    
    for i in 0..<4 {
        let nx = x + dir[i].x
        let ny = y + dir[i].y
    
        if nx < 0 || nx >= limit || ny < 0 || ny >= limit {
            continue
        }
        
        if visited[nx][ny] == true { continue }

        if cur == "B" {
            if map[nx][ny] == cur {
                recurD(nx, ny)
            } else {
                continue
            }
        } else {
            if map[nx][ny] == "B" {
                continue
            } else {
                recurD(nx, ny)
            }
        }
    }
}

print(countA, countD)
