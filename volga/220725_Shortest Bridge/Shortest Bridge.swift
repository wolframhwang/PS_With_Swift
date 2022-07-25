class Solution {
    var visit: [[Int]] = []    
    var disit: [[(x: Int, y: Int)]] = [[], []]
    var map: [[Int]] = []
    var answer = 987654321
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    func recur(_ x: Int, _ y: Int, _ cnt: Int) {
        visit[x][y] = cnt
        var isTeduri = false
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]
            if nx < 0 || nx >= visit.count || ny < 0 || ny >= visit[nx].count { continue }
            if visit[nx][ny] != 0 { continue }
            if map[nx][ny] != 1 { isTeduri = true; continue }
            recur(nx, ny, cnt)
        }
        if isTeduri {
            disit[cnt - 1].append((x, y))
        }
    }

    func shortestBridge(_ grid: [[Int]]) -> Int {
        let n = grid.count
        let range = 0..<n
        let INF = 987654321
        let visitLayer = [Int](repeating: 0, count: n)
        
        visit = [[Int]](repeating: visitLayer, count: n)
        map = grid
        var number = 1

        for i in range {
            for j in range {
                if visit[i][j] == 0, grid[i][j] == 1 {
                    recur(i, j, number)
                    number += 1
                }
            }
        }

        for i in 0..<disit[0].count {
            for j in 0..<disit[1].count {
                let dist = abs(disit[0][i].x - disit[1][j].x) + abs(disit[0][i].y - disit[1][j].y)
                answer = min(dist, answer)
            }
        }

        return answer - 1
    }
}
