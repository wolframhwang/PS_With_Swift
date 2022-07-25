let NMR = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMR[0], M = NMR[1], R = NMR[2]
var map: [[Int]] = []
var answer: [[Int]] = []
for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var size = 0
var arr: [(x: Int, y: Int)] = [(x: Int, y: Int)](repeating: (0, 0), count: N * M * 10)

answer = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

for i in 0..<min(N, M)/2 {
    size = 0
    var x = i, y = i
    while y < N - i {
        arr[size] = (y, x)
        y += 1
        size += 1
    }
    y -= 1; x += 1
    while x < M - i {
        arr[size] = (y, x)
        x += 1
        size += 1
    }
    y -= 1; x -= 1
    while y >= i {
        arr[size] = (y, x)
        y -= 1
        size += 1
    }
    y += 1; x -= 1;
    while x > i {
        arr[size] = (y, x)
        x -= 1
        size += 1
    }

    for j in 0..<size {
        let p = arr[(j + R) % size]
        answer[p.x][p.y] = map[arr[j].x][arr[j].y]
    }
    
}

for i in 0..<N {
    for j in 0..<M {
        print(answer[i][j], terminator: " ")
    }
    print()
}
