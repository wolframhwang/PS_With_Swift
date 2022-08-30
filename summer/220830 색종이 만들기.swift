// BOJ 2630 색종이 만들기
let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)
var result = [0, 0]

for i in 0..<n {
    map[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
}

func checkSquare(_ x: Int, _ y: Int, _ xx: Int, _ yy: Int) -> Bool {
    let first = map[x][y]
    
    for i in x..<xx {
        for j in y..<yy {
            if map[i][j] != first { return false }
        }
    }
    
    result[first] += 1
    return true
}

func recur(_ size: Int, _ x: Int, _ y: Int, _ xx: Int, _ yy: Int) {
    if size == 0 { return }
    if checkSquare(x, y, xx, yy) { return }
    
    let halfx = (x + xx) / 2
    let halfy = (y + yy) / 2
    recur(size / 2, x, y, halfx, halfy)
    recur(size / 2, x, halfy, halfx, yy)
    recur(size / 2, halfx, y, xx, halfy)
    recur(size / 2, halfx, halfy, xx, yy)
}

recur(n, 0, 0, n, n)
result.forEach { print($0) }
