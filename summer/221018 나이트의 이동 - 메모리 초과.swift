let dx = [-2, -2, -1, -1, 1, 1, 2, 2]
let dy = [1, -1, 2, -2, 2, -2, 1, -1]
var startX = 0, startY = 0 // 행, 열
var targetX = 0, targetY = 0
var limit = 0

var visited: [[Int]] = []
//var answer: [Int] = []

func bfs(_ x: Int, _ y: Int) {
    var queue: [(x: Int, y: Int, count: Int)] = []
    queue.append((x, y, 0))
    var front = 0
    visited[x][y] = 0

    while queue.count != front {
        let now = queue[front]
        front += 1

        if now.x == targetX, now.y == targetY { break }

        for i in 0..<8 {
            let nx = now.x + dx[i]
            let ny = now.y + dy[i]

            if nx < 0 || nx >= limit || ny < 0 || ny >= limit { continue }

            if visited[nx][ny] < now.count + 1 { continue }
            visited[nx][ny] = now.count + 1

            queue.append((nx, ny, now.count + 1))
        }
    }
}

func solve() {
    bfs(startX, startY)
    print(visited[targetX][targetY])
}

func main() {
    let cases = Int(readLine()!)!

    for _ in 0..<cases {
        limit = Int(readLine()!)!
        visited = Array(repeating: Array(repeating: Int.max, count: limit), count: limit)

        let start = readLine()!.split(separator: " ").map { Int($0)! }
        startX = start[0] // 행
        startY = start[1] // 열

        let target = readLine()!.split(separator: " ").map { Int($0)! }
        targetX = target[0]
        targetY = target[1]

        solve()
    }
}

main()
