// BOJ 17144 미세먼지 안녕

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0]
let c = input[1]
let t = input[2]
var cleaner = [Int]()

var map = Array(repeating: [Int](), count: r)
for i in 0..<r {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map[i].append(contentsOf: line)
    if line.contains(-1) {
        cleaner.append(i)
    }
}

var visited = Array(repeating: Array(repeating: false, count: c), count: r)

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

func diffuse(_ map: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: c), count: r)
    result[cleaner[0]][0] = -1
    result[cleaner[1]][0] = -1
    
    for i in 0..<r {
        for j in 0..<c {
            if map[i][j] == -1 { result[i][j] = -1 }
            else if map[i][j] >= 5 {
                var count = 0
                for d in 0..<4 {
                    let nr = i + dr[d]
                    let nc = j + dc[d]
                    
                    if nr < 0 || nr >= r || nc < 0 || nc >= c { continue }
                    if map[nr][nc] == -1 { continue }
                    
                    result[nr][nc] += map[i][j] / 5
                    count += 1
                }
                result[i][j] += map[i][j] - (map[i][j] / 5) * count
            } else {
                result[i][j] += map[i][j]
            }
        }
    }
    
    return result
}

func cleanseTop(_ map: [[Int]]) -> [[Int]] {
    var result = map
    result[cleaner[0]][1] = 0
    
    for j in 2..<c {
        result[cleaner[0]][j] = map[cleaner[0]][j - 1]
    }

    for i in 0..<cleaner[0] {
        result[i][c - 1] = map[i + 1][c - 1]

    }
    
    for j in 0..<c - 1 {
        result[0][j] = map[0][j + 1]
    }
    
    for i in 1..<cleaner[0] {
        result[i][0] = map[i - 1][0]
    }
    
    return result
}

func cleanseBottom(_ map: [[Int]]) -> [[Int]] {
    var result = map
    result[cleaner[1]][1] = 0
    
    for j in 2..<c {
        result[cleaner[1]][j] = map[cleaner[1]][j - 1]
    }
    
    for i in cleaner[1] + 1..<r {
        result[i][c - 1] = map[i - 1][c - 1]
    }
    
    for j in 0..<c - 1 {
        result[r - 1][j] = map[r - 1][j + 1]
    }
    
    for i in cleaner[1] + 1..<r - 1 {
        result[i][0] = map[i + 1][0]
    }
    
    return result
}

func act(_ map: [[Int]]) -> [[Int]] {
    var result = diffuse(map)
    print(result)
    result = cleanseTop(result)
    result = cleanseBottom(result)
    
    return result
}

for _ in 0..<t {
    let result = act(map)
    map = result
}

print(map)
var count = 0
for i in 0..<r {
    for j in 0..<c {
        if map[i][j] > 0 {
            count += map[i][j]
        }
    }
}

print(count)
