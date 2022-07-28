class Solution {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var grids = grid
        var answer = 0, area = 0
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grids[i][j] == 1 {
                    area = 0
                    recur(i, j)
                    answer = max(answer, area)
                }
            }
        }

        func recur(_ x: Int, _ y: Int) {
            area += 1
            grids[x][y] = 0

            for i in 0..<4 {
                let nx = x + dx[i], ny = y + dy[i]
                if nx < 0 || nx >= grids.count || ny < 0 || ny >= grids[nx].count { continue }
                if grids[nx][ny] == 0 { continue }
                recur(nx, ny)
            }
        }

        return answer
    }
}
