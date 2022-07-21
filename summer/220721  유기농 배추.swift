import Foundation

let tests = Int(readLine()!)!
var results = [Int]()

for _ in 0..<tests {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let col = input[0]
    let row = input[1]
    let size = input[2]

    var map = Array(repeating: Array(repeating: 0, count: col), count: row)
    for _ in 0..<size {
        let pos = readLine()!.split(separator: " ").map { Int($0)! }
        let x = pos[0]
        let y = pos[1]
        map[y][x] = 1
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    func recur(_ x: Int, _ y: Int) {
        map[y][x] = 0
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
        
            if nx < 0 || nx >= col || ny < 0 || ny >= row {
                continue
            }
            
            if map[ny][nx] == 0 { continue }
            recur(nx, ny)
        }
    }
    
    var result = 0
    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == 1 {
                recur(j, i)
                result += 1
            }
        }
    }
    results.append(result)
}

results.forEach { print($0) }
