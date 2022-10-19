var n = 0, m = 0
var map: [[Int]] = []
var visited: [[Bool]] = []

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

func bfs(_ r: Int, _ c: Int) -> Bool {
    var queue: [(r: Int, c: Int)] = []
    queue.append((r, c))
    var front = 0
    visited[r][c] = true
    
    while queue.count != front {
        let now = queue[front]
        front += 1
        
        if now.r == n - 1 { return true }
        
        for i in 0..<4 {
            let nr = now.r + dr[i]
            let nc = now.c + dc[i]
            
            if nr < 0 || nr >= n || nc < 0 || nc >= m { continue }
            if visited[nr][nc] { continue }
            if map[nr][nc] == 1 { continue }
            
            visited[nr][nc] = true
            queue.append((nr, nc))
        }
    }
    
    return false
}

func solve() {
    for i in 0..<m {
        if visited[0][i] { continue }
        if map[0][i] == 1 { continue }
        if bfs(0, i) {
            print("YES")
            return
        }
    }

    print("NO")
}

func main() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    n = input[0]
    m = input[1]
    
    for _ in 0..<n {
        map.append(readLine()!.map{ Int(String($0))! })
    }
    
    visited = Array(repeating: Array(repeating: false, count: m), count: n)
    solve()
}

main()
