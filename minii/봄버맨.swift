import Foundation

let RCN = readLine()!.split(separator: " ").map { Int($0)! }
let r = RCN[0], c = RCN[1]
var n = RCN[2]
let xAxis = [1, -1, 0, 0], yAxis = [0, 0, 1, -1]
var map = [[Bool]].init(repeating: [Bool].init(repeating: true, count: c), count: r)
var bombs: [(x: Int, y: Int)] = []
var sec: Int = 1

func makeInput() {
    for row in 0..<r {
        let inputs = readLine()!.map { String($0) }
        var col = 0
        
        for value in inputs {
            map[row][col] = (value == "O")
            col += 1
        }
    }
}

func makeBombs() {
    bombs = []
    
    if sec == n { return }
    
    for r in 0..<map.count {
        for c in 0..<map[r].count {
            if map[r][c] {
                bombs.append((r, c))
            } else {
                map[r][c] = true
            }
        }
    }
    
    sec += 1
}

extension Array where Element == [Bool] {
    func convertResult() -> [String] {
        var result = [String]()
        for v in self {
            var str = ""
            
            for i in v {
                if i {
                    str += "O"
                } else {
                    str += "."
                }
            }
            
            result.append(str)
        }
        
        return result
    }
}

func bfs() {
    var front = 0
    
    if sec == n { return }
    sec += 1
    while bombs.count != front {
        let bomb = bombs[front]
        front += 1
        let cur = map[bomb.x][bomb.y]
        if cur {
            map[bomb.x][bomb.y] = false
        }
        
        for idx in 0..<xAxis.count {
            let dx = (bomb.x + xAxis[idx])
            let dy = (bomb.y + yAxis[idx])
            
            if dx < 0 || dx >= r || dy < 0 || dy >= c { continue }
            if !map[dx][dy] { continue }
            map[dx][dy] = false
        }
    }
}

func printResult() {
    map.convertResult().forEach {
        print($0)
    }
}

func main() {
    makeInput()
    
    while sec != n {
        makeBombs()
        bfs()
    }
    printResult()
}

main()
