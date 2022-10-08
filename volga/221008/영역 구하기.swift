let MNK = readLine()!.split(separator: " ").map { Int($0)! }
let M = MNK[0], N = MNK[1], K = MNK[2], dx = [0,0,1,-1], dy = [1,-1,0,0]

var map = [[Int]](repeating: [Int](repeating: 0, count: M), count: N)

for _ in 0..<K {
    let rectangle = readLine()!.split(separator: " ").map { Int($0)! }
    for i in rectangle[0]..<rectangle[2] {
        for j in rectangle[1]..<rectangle[3] {
            map[i][j] = 1
        }
    }
}

func flood_fill(_ x: Int, _ y: Int) -> Int {
    var ret = 1
    var q: [(x: Int, y: Int)] = [(x, y)]
    var front = 0
    map[x][y] = 1
    
    while q.count != front {
        let now = q[front]
        front += 1
        
        for i in 0..<4 {
            let nx = now.x + dx[i], ny = now.y + dy[i]
            if nx < 0 || nx >= N  || ny < 0 || ny >= M { continue }
            if map[nx][ny] == 1 { continue }
            map[nx][ny] = 1
            q.append((nx, ny))
            ret += 1
        }
    }
    return ret
}
var answer: [Int] = []
for i in 0..<N {
    for j in 0..<M {
        if map[i][j] == 0 {
            answer.append(flood_fill(i, j))
        }
    }
}
print(answer.count)
answer.sorted().forEach { ele in
    print(ele, terminator: " ")
}

