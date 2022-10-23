var row = 0, col = 0
var map: [[Character]] = []
var visited: [[Int]] = []

var distance: Int = 0

// 각 좌표별로 모든 칸에 가는 거리를 기록 후 (시작좌표, 끝좌표, 가장먼거리)를 전역변수에 기록
// 가장먼거리가 더 먼게 나오면 바꿔줌
// 추가 고려사항: 후보가 될 수 있는 칸만 탐색하기
// 후보가 될 수 있는 칸: 세로 또는 가로로 3칸이 연속된 경우는 후보가 될 수 없음

let dr = [0, 0, 1, -1]
let dc = [1, -1, 0, 0]

func bfs(_ r: Int, _ c: Int) {
    var queue: [(r: Int, c: Int, count: Int)] = []
    queue.append((r, c, 0))
    visited[r][c] = 0
    var front = 0
    
    while queue.count != front {
        let now = queue[front]
        front += 1
        
        for i in 0..<4 {
            let nr = now.r + dr[i]
            let nc = now.c + dc[i]
            
            if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
            if map[nr][nc] == "W" { continue }
            if visited[nr][nc] != -1 { continue }
            visited[nr][nc] = now.count + 1
            queue.append((nr, nc, now.count + 1))
            
            if now.count + 1 > distance {
                distance = now.count + 1
            }
        }
    }
}

func check(_ r: Int, _ c: Int) -> Bool {
    
    // 가로 3개 연속
    if r - 1 >= 0, r + 1 < row, map[r - 1][c] == "L", map[r + 1][c] == "L" { return true }
    else if c - 1 >= 0, c + 1 < col, map[r][c - 1] == "L", map[r][c + 1] == "L" { return true }
    else { return false }
}

func solve() {
    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == "W" { continue }
            if check(i, j) { continue }
            visited = Array(repeating: Array(repeating: -1, count: col), count: row)
            bfs(i, j)
        }
    }
    
    print(distance)
}

func main() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    row = input[0]
    col = input[1]
    
    for _ in 0..<row {
        let line = Array(readLine()!)
        map.append(line)
    }
    solve()
}

main()
