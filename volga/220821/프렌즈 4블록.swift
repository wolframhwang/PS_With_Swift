import Foundation

var map: [[Character]] = []
var answer = 0
let mask = 0x3fffffff
func makeKey(_ x: Int, _ y: Int) -> Int {
    return x << 30 + y
}
func resolveKey(_ key: Int) -> (x: Int, y: Int) {
    return (key >> 30, key & (mask))
}

func solve() {
    while true {
        var keySet = Set<Int>()
        for i in 0..<map.count-1 {
            for j in 0..<map[i].count-1 {
                if map[i][j] == " " { continue }
                if map[i][j] == map[i + 1][j], map[i][j] == map[i][j + 1], map[i][j] == map[i + 1][j + 1] {
                    keySet.insert(makeKey(i, j))
                    keySet.insert(makeKey(i + 1, j))
                    keySet.insert(makeKey(i, j + 1))
                    keySet.insert(makeKey(i + 1, j + 1))
                }
            }
        }
        
        if keySet.isEmpty { break }
        answer += keySet.count
        
        for key in keySet {
            let node = resolveKey(key)
            map[node.x][node.y] = " "
        }
        
        for j in 0..<map[0].count {
            for i in (0..<map.count).reversed() {
                if map[i][j] == " " {
                    for k in (0..<i).reversed() {
                        if map[k][j] != " " {
                            let temp = map[k][j]
                            map[k][j] = map[i][j]
                            map[i][j] = temp
                            break
                        }
                    }
                }
            }
        }
    }
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    for line in board {
        map.append([])
        for c in line {
            map[map.count - 1].append(c)
        }
    }
    
    solve()
    
    return answer
}
