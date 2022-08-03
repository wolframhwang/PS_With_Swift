import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let colMax = input[0]
let rowMax = input[1]

var map = Array(repeating: [Int](), count: rowMax)
var visited = Array(repeating: Array(repeating: false, count: colMax), count: rowMax)
let dir = [(x: 0, y: 1), (x: 0, y: -1), (x: 1, y: 0), (x: -1, y: 0)]
var queue = [(x: Int, y: Int)]()
var nextQueue = [(x: Int, y: Int)]()
var result = 0

for i in 0..<rowMax {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    var temp = [(x: Int, y: Int)]()
    for j in 0..<colMax {
        if line[j] == 1 {
            temp.append((x: i, y: j))
        }
    }
    if !temp.isEmpty { queue.append(contentsOf: temp) }
    map[i].append(contentsOf: line)
}

if queue.isEmpty {
    print(0)
} else {
    while !queue.isEmpty {
        for spot in queue {
            fill(spot.x, spot.y)
        }
        queue.removeAll()
        queue.append(contentsOf: nextQueue)
        nextQueue.removeAll()
        result += 1
    }
    
    for line in map {
        var zero = 0
        if line.contains(0) {
            zero += 1
            if zero > 0 {
                print(-1)
                break
            }
        } else {
            print(result - 1)
            break
        }
    }
}

func fill(_ x: Int, _ y: Int) {
    visited[x][y] = true
    
    for n in 0..<4 {
        let nx = x + dir[n].x
        let ny = y + dir[n].y
        
        if nx < 0 || nx >= rowMax || ny < 0 || ny >= colMax || map[nx][ny] == -1 || visited[nx][ny] == true { continue }
        map[nx][ny] = 1
        nextQueue.append((x: nx, y: ny))
    }
}
