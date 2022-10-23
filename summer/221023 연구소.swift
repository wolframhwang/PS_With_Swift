var row = 0, col = 0
var map: [[Int]] = []
var answer: Int = 0
var counted: [[Bool]] = []
var visited: [[Bool]] = []
var test: [(r: Int, c: Int)] = []

let dr = [1, -1, 0, 0]
let dc = [0, 0, 1, -1]

// 풀이방법
// 브루트포스: 2와 1이 아닌 칸들에 다 벽을 세워보고 안전영역 계산
// 2초, 최대 8*8
// 빈 칸의 최대 개수 = 62
// 62C3 + 64 + 64가 최대 연산일듯?? = 62*61*60 / 6 + 64 + 64

func solve() {
    visited = Array(repeating: Array(repeating: false, count: col), count: row)
    for r in 0..<row {
        for c in 0..<col {
            if map[r][c] != 0 { continue }
            map[r][c] = 1
            build(r, c, 1)
            visited[r][c] = true
            map[r][c] = 0
        }
    }
}

// 벽을 세우는 함수
func build(_ r: Int, _ c: Int, _ cnt: Int) {
    if cnt == 3 {
        var fillMap = map
        let result = fill(&fillMap)
        answer = result > answer ? result : answer
        return
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if visited[i][j] { continue }
            if map[i][j] != 0 { continue }
            map[i][j] = 1
            visited[i][j] = true
            build(i, j, cnt + 1)
            map[i][j] = 0
            visited[i][j] = false
        }
    }
}

// 바이러스를 채우고, 바이러스 칸만큼 결과에서 빼주는 함수
func fill(_ map: inout [[Int]]) -> Int {
    var result = 0
    counted = Array(repeating: Array(repeating: false, count: col), count: row)
    var queue: [(r: Int, c: Int)] = []
    
    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == 2 { queue.append((i, j)) }
        }
    }
    
    var front = 0
    
    // 2인 지점에서 상하좌우 탐색 후 0이면 2로 바꾸고 큐에 넣는다
    while queue.count != front {
        let now = queue[front]
        front += 1
        
        for i in 0..<4 {
            let nr = now.r + dr[i]
            let nc = now.c + dc[i]
            
            if nr < 0 || nr >= row || nc < 0 || nc >= col { continue }
            if map[nr][nc] != 0 { continue }
            map[nr][nc] = 2
            queue.append((nr, nc))
        }
    }
        
    var count = 0
    for i in 0..<row {
        for j in 0..<col {
            if map[i][j] == 0 { count += 1 }
        }
    }
    
    result = count > result ? count : result
    return result
}

func main() {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    row = input[0]
    col = input[1]
    
    for _ in 0..<row {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        map.append(line)
    }
    
    solve()
    print(answer)
}

main()
