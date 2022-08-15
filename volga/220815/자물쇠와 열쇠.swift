import Foundation

var keys: [[[Int]]] = []
var N = 0, M = 0

func rotate(_ idx: Int) {
    var key: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: M), count: M)
    for i in 0..<M {
        for j in 0..<M {
            key[j][M - i - 1] = keys[idx][i][j]
        }
    }
    keys.append(key)
}

func fill(_ x: Int, _ y: Int, _ idx: Int, _ lock: [[Int]]) -> Bool {
    var lck = lock
    for i in 0..<M {
        for j in 0..<M {
            if x + i >= N || y + j >= N || x + i < 0 || y + j < 0 { continue }
            lck[x + i][y + j] += keys[idx][i][j]
        }
    }
    
    for i in 0..<N {
        for j in 0..<N {
            if lck[i][j] == 2 { return false }
            if lck[i][j] == 0 { return false }
        }
    }
    return true
}

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var answer = false
    keys.append(key)
    M = key.count
    N = lock.count
    for i in 0..<3 {
        rotate(i)
    }
    
    for i in (-M+1)..<N {
        for j in (-M+1)..<N {
            for k in 0..<4 {
                let result = fill(i, j, k, lock)
                if result { return result }
            }
        }
    }
    
    return false
}

