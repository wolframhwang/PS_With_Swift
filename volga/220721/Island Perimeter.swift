class Solution {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    var answer = 0
    var map: [[Int]] = []

    func recur(_ x: Int, _ y: Int) {
        map[x][y] = -1
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]
            if nx < 0 || nx >= map.count || ny < 0 || ny >= map[nx].count { answer += 1; continue }
            if map[nx][ny] == -1 { continue}
            if map[nx][ny] == 0 { answer += 1; continue}
            recur(nx, ny)
        }
    }

    func islandPerimeter(_ grid: [[Int]]) -> Int {
        map = grid
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if map[i][j] == 1 {
                    recur(i, j)
                }
            }
        }

        return answer
    }
}
