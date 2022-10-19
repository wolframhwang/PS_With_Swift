let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0], M = NM[1]
let axisX = [1, -1, 0, 0], axisY = [0, 0, 1, -1]
var map = [[Int]](repeating: [Int](), count: M)
var visit = [[Bool]](repeating: [Bool](repeating: false, count: N), count: M)

for row in 0..<M {
    let input = readLine()!
    
    for char in input {
        if char == "W" {
            map[row].append(0)
        } else {
            map[row].append(1)
        }
    }
}

func bfs(_ x: Int, _ y: Int) -> Int {
    var queue: [(x: Int, y: Int)] = [(x, y)]
    var front = 0
    let target = map[x][y]
    visit[x][y] = true
    
    while queue.count != front {
        let now = queue[front]
        front += 1
        
        for i in 0..<axisX.count {
            let dx = axisX[i], dy = axisY[i]
            
            let lx = now.x + dx
            let ly = now.y + dy
            
            if lx < 0 || lx >= M || ly < 0 || ly >= N { continue }
            if visit[lx][ly] { continue }
            if map[lx][ly] != target { continue }
            
            visit[lx][ly] = true
            queue.append((lx, ly))
        }
    }
    
    return queue.count * queue.count
}


var result: [Int: Int] = [0: 0, 1: 0]
for row in 0..<M {
    for col in 0..<N {
        if !visit[row][col] {
            let value = bfs(row, col)
            result[map[row][col], default: 0] += value
        }
    }
}
print(result[0, default: 0], result[1, default: 0])
