let T = Int(readLine()!)!
let dx = [0,0,1,-1]
let dy = [1,-1,0,0]

var answer = 0
var map: [[Int]] = []
for _ in 0..<T {
    answer = 0
    let MNK = readLine()!.split(separator: " ").map { Int($0)! }
    let M = MNK[0], N = MNK[1], K = MNK[2]
    map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

    for _ in 0..<K {
        let yx = readLine()!.split(separator: " ").map { Int($0)! }
        map[yx[1]][yx[0]] = 1
    }

    for i in 0..<N {
        for j in 0..<M {
            if map[i][j] == 1 { 
                recur(i, j)
                answer += 1
            }
        }
    }

    print(answer)
}

func recur(_ x: Int, _ y: Int) {
    map[x][y] = 0

    for i in 0..<4 {
        let nx = x + dx[i], ny = y + dy[i]
        if nx < 0 || nx >= map.count || ny < 0 || ny >= map[0].count { continue }
        if map[nx][ny] == 0 { continue }
        recur(nx, ny)
    }
}
