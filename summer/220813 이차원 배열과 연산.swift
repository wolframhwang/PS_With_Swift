// BOJ 17140 이차원 배열과 연산

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let r = input[0] - 1
let c = input[1] - 1
let k = input[2]

var arr = Array(repeating: [Int](), count: 3)

for i in 0..<3 {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    arr[i].append(contentsOf: line)
}

func sortRow(_ arr: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: 100), count: 100)
    
    for i in 0..<arr.count {
        var numbers = Array(repeating: 0, count: 101)
        for j in 0..<arr[i].count {
            numbers[arr[i][j]] += 1
        }

        let max = numbers.max()!
        var cur = 1
        var col = 0
        
        while cur <= max {
            if cur == 100 { break }
            for m in 0..<numbers.count {
                if m == 0 { continue }
                if col == 100 { break }
                if numbers[m] == cur {
                    result[i][col] = m
                    col += 1
                    result[i][col] = cur
                    col += 1
                }
            }
            cur += 1
        }
    }
    
    return result
}

func sortCol(_ arr: [[Int]]) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: 100), count: 100)
    
    for j in 0..<arr[0].count {
        var numbers = Array(repeating: 0, count: 101)
        for i in 0..<arr.count {
            numbers[arr[i][j]] += 1
        }
        
        let max = numbers.max()!
        var cur = 1
        var row = 0
        
        while cur <= max {
            if cur == 100 { break }
            for m in 0..<numbers.count {
                if m == 0 { continue }
                if row == 100 { break }
                if numbers[m] == cur {
                    result[row][j] = m
                    row += 1
                    result[row][j] = cur
                    row += 1
                }
            }
            cur += 1
        }
    }
    
    return result
}

func findLarger(_ arr: [[Int]]) -> Bool {
    var maxRow = 0
    var maxCol = 0
    
    for i in 0..<arr.count {
        for j in 0..<arr[i].count {
            if arr[i][j] == 0 { continue }
            if i > maxRow { maxRow = i }
            if j > maxCol { maxCol = j }
        }
    }
    
    return maxRow >= maxCol ? true : false
}

var sec = 0

while sec <= 100 {
    if r < arr.count && c < arr[0].count {
        if arr[r][c] == k { break }
    }
    
    if findLarger(arr) {
        arr = sortRow(arr)
    } else {
        arr = sortCol(arr)
    }
    sec += 1
}

if sec <= 100 {
    print(sec)
} else {
    print(-1)
}
