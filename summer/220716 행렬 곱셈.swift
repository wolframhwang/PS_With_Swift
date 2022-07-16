// BOJ 2740 행렬 곱셈

import Foundation

let aSize = readLine()!.split(separator: " ").map { Int($0)! }
let aRow = aSize[0]
let aCol = aSize[1]

var a = Array(repeating: [Int](), count: aRow)
for i in 0..<aRow {
    a[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
}

let bSize = readLine()!.split(separator: " ").map { Int($0)! }
let bRow = bSize[0]
let bCol = bSize[1]

var b = Array(repeating: [Int](), count: bRow)
for i in 0..<bRow {
    b[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
}

var result = Array(repeating: Array(repeating: 0, count: bCol), count: aRow)

// result[0][0] = a[0][0]*b[0][0] + a[0][1]*b[1][0] + a[0][2]*b[2][0] + ...
// result[0][1] = a[0][0]*b[0][1] + a[0][1]*b[1][1] + a[0][2]*b[2][1] + ...

var row = 0
var col = 0

// 결과 행렬의 row 갯수 = 첫 번째 행렬의 row 갯수
while row < aRow {
    // 결과 행렬의 칼럼 갯수 = 두 번째 행렬의 칼럼 갯수
    while col < bCol {
        // 첫번째 행렬의 칼럼과 두번째 행렬의 row가 같은 값으로 움직인다
        for j in 0..<bRow {
            result[row][col] += a[row][j] * b[j][col]
            print("[row][col]: [\(row)][\(col)]")
            print("a[row][j]:", "a[",row,"][",j,"]")
            print("b[j][col]:", "b[",j,"][",col,"]")
        }
        // 두번째 행렬의 다음 칼럼으로 작업하기 위해 더해준다
        col += 1
    }
    // row가 바뀌면, 다시 두 번째 행렬의 0번째 칼럼부터 계산해야 함
    col = 0
    row += 1
}

for line in result {
    line.forEach { print($0, terminator: " ") }
    print()
}
