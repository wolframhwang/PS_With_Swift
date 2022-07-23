import Foundation

let end: String = "0 0"

var results = [Int]()

while true {
    let size = readLine()!.split(separator: " ").map { Int($0)! }
    if size[0] == 0 && size[1] == 0 { break }
    let col = size[0]
    let row = size[1]
    var count = 0
    
    var map = Array(repeating: [Int](), count: row)
    
    for i in 0..<row {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map[i].append(contentsOf: line)
    }

    let dx = [0, 0, 1, 1, 1, -1, -1, -1]
    let dy = [1, -1, 0, -1, 1, 0, 1, -1]
    
    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == 1 {
                recur(i, j)
                count += 1
            }
        }
    }
    
    results.append(count)
    
    func recur(_ x: Int, _ y: Int) {
        map[x][y] = 0
        for i in 0..<8 {
            let nx = x + dx[i]
            let ny = y + dy[i]
        
            if nx < 0 || nx >= row || ny < 0 || ny >= col { continue }

            if map[nx][ny] == 0 { continue }
            
            recur(nx, ny)
        }
        
    }

}

results.forEach { print($0) }
