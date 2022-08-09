// BOJ 15685 드래곤 커브

import Foundation

let size = Int(readLine()!)!
// x: col y: row, 0 1 2 3
let dir = [(x: 1, y: 0), (x: 0, y: -1), (x: -1, y: 0), (x: 0, y: 1)]
var map = Array(repeating: Array(repeating: 0, count: 101), count: 101)
var visited = Array(repeating: false, count: 3000)
var vmap = Array(repeating: Array(repeating: false, count: 101), count: 101)
var answer = 0

var dirStack = [Int]()
func drawCurve(_ x: Int, _ y: Int, _ curGen: Int, _ limit: Int) {
    if curGen > limit {
        return
    }

    var curX = x
    var curY = y
    
    for i in 0..<dirStack.count {
        if visited[i] == true { continue }
        visited[i] = true
        
        curX += dir[dirStack[i]].x
        curY += dir[dirStack[i]].y
        
        map[curX][curY] = 1
    }
    
    editStack()

    drawCurve(curX, curY, curGen + 1, limit)
}

func editStack() {
    var stackCopy = dirStack
    
    while !stackCopy.isEmpty {
        let last = stackCopy.removeLast()
        if last == 3 {
            dirStack.append(0)
        } else {
            dirStack.append(last + 1)
        }
    }
}

for _ in 0..<size {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let x = input[0]
    let y = input[1]
    let dirIdx = input[2]
    let maxGen = input[3]
    
    dirStack.append(dirIdx)
    map[x][y] = 1
    drawCurve(x, y, 0, maxGen)
    dirStack = []
    visited = Array(repeating: false, count: 3000)
}

let dx = [1, 1, 0]
let dy = [0, 1, 1]

for i in 0..<101 {
    for j in 0..<101 {
        if map[i][j] == 0 { continue }
        if vmap[i][j] { continue }
        vmap[i][j] = true
        
        var isCube = true
        
        for d in 0..<3 {
            let nx = i + dx[d]
            let ny = j + dy[d]
            
            if nx < 0 || nx >= 101 || ny < 0 || ny >= 101 {
                isCube = false
                break
            }
            
            if map[nx][ny] == 0 {
                isCube = false
                break
            }
        }
        
        if isCube {
            answer += 1
        }
    }
}

print(answer)
