// BOJ 15686 치킨 배달

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let size = input[0]
let limit = input[1]

var map = Array(repeating: [Int](), count: size)
for i in 0..<size {
    map[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
}

var chicken = 0
var chickens = [(x: Int, y: Int, open: Bool)]()
var houses = [(x: Int, y: Int)]()
for i in 0..<size {
    for j in 0..<size {
        if map[i][j] == 2 {
            chicken += 1
            chickens.append((x: i, y: j, open: false))
        }
        if map[i][j] == 1 {
            houses.append((x: i, y: j))
        }
    }
}

func getChickenDist() -> Int {
    var chickenDist = [Int]()

    for i in 0..<houses.count {
        var min = size * 2
        for j in 0..<chickens.count {
            if chickens[j].open == false { continue }
            let curDist = abs(houses[i].x - chickens[j].x) + abs(houses[i].y - chickens[j].y)
            if curDist < min {
                min = curDist
            }
        }
        chickenDist.append(min)
    }
    
    return chickenDist.reduce(0, +)
}

var chickenDist = Int.max
var visited = [Bool](repeating: false, count: chickens.count)
func recur(_ limit: Int, _ count: Int, _ idx: Int) {
    if count == limit {
        let curDist = getChickenDist()
        if curDist < chickenDist {
            chickenDist = curDist
        }
        return
    }
    
    if idx >= chickens.count {
        return
    }
    
    chickens[idx].open = true
    visited[idx] = true
    recur(limit, count + 1, idx + 1)
    visited[idx] = false
    chickens[idx].open = false
    recur(limit, count, idx + 1)
}


recur(limit, 0, 0)
print(chickenDist)
