let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

var map: [[Character]] = []
var row = 0, col = 0
var visited: [[Bool]] = []

func fetchInput() {
    let size = readLine()!.split(separator: " ").map { Int($0)! }
    col = size[0]
    row = size[1]

    for _ in 0..<row {
        let line = Array(readLine()!)
        map.append(line)
    }
    
    for _ in 0..<row {
        visited.append(Array(repeating: false, count: col))
    }
}

func bfs(_ x: Int, _ y: Int, _ char: Character) -> Int {
    var queue: [(x: Int, y: Int)] = []
    queue.append((x, y))
    var front = 0
    visited[x][y] = true
    var count = 0
    
    while queue.count != front {
        let now = queue[front]
        front += 1
        count += 1
        
        for i in 0..<4 {
            let nx = now.x + dx[i]
            let ny = now.y + dy[i]
            
            if nx < 0 || nx >= row || ny < 0 || ny >= col { continue }
            if visited[nx][ny] { continue }
            if map[nx][ny] != char { continue }
            visited[nx][ny] = true
            queue.append((nx, ny))
        }
    }
    
    return count
}

func solve() {
    var wSum = 0, bSum = 0
    
    for i in 0..<row {
        for j in 0..<col {
            if visited[i][j] { continue }
            if map[i][j] == "W" {
                let sum = bfs(i, j, "W")
                wSum += sum * sum
            }
            if map[i][j] == "B" {
                let sum = bfs(i, j, "B")
                bSum += sum * sum
            }
        }
    }
    
    print(wSum, bSum)
}

func main() {
    fetchInput()
    solve()
}

main()
