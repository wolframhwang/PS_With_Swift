let n = Int(readLine()!)!
var map = Array(repeating: [Int](), count: n)

for i in 0..<n {
    map[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
}

// -1, 0, 1
var result = [0, 0, 0]
// 새로운 배열을 생성하지 않고 기존 배열 내에서 검사하려면?
// 넘겨받는 매개변수가 배열이 아니라, 검사를 시작하는 좌표값 & 검사를 끝내는 좌표값 이면 가능할듯

func check(_ x: Int, _ y: Int, _ xx: Int, _ yy: Int) -> Bool {
    let first = map[x][y]
    
    for i in x..<xx {
        for j in y..<yy {
            if map[i][j] != first { return false }
        }
    }
    
    result[first + 1] += 1
    return true
}

func re(_ x: Int, _ y: Int, _ xx: Int, _ yy: Int) {
    if check(x, y, xx, yy) {
        return
    }
    
    // 0 1 2 / 3 4 5 / 6 7 8
    // (9 - 0) / 3 = 3
    let addx = (xx - x) / 3
    let addy = (yy - y) / 3
    // 0, 0, 0 + 3, 0 + 3 -> (0, 0)에서 (3,3) 전까지
    re(x, y, x + addx, y + addy)
    // 0, 3, 3, 6 -> (0,3)에서 (3, 6) 전까지
    re(x, y + addy, x + addx, y + 2 * addy)
    re(x, y + 2 * addy, x + addx, yy)
    // 3, 0, 6, 3 -> (3, 0)에서 (6, 3) 전까지
    re(x + addx, y, x + 2 * addx, y + addy)
    // 3, 3, 6, 6 -> (3, 3)에서 (6,6) 전까지
    re(x + addx, y + addy, x + 2 * addx, y + 2 * addy)
    re(x + addx, y + 2 * addy, x + 2 * addx, yy)
    re(x + 2 * addx, y, xx, y + addy)
    re(x + 2 * addx, y + addy, xx, y + 2 * addy)
    re(x + 2 * addx, y + 2 * addy, xx, yy)
}

re(0, 0, n, n)
result.forEach { print($0) }
