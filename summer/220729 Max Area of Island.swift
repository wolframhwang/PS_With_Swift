class Solution {
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        var max = 0
        let dir = [(x: 0, y: 1), (x: 0, y: -1), (x: 1, y: 0), (x: -1, y: 0)]
        var visited = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        var sum = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 0 { continue }
                if visited[i][j] == true { continue }
                recur(i, j)
                if sum > max { max = sum }
                sum = 0
            }
        }
        
        func recur(_ x: Int, _ y: Int) {
            visited[x][y] = true
            sum += 1
            
            for i in 0..<4 {
                let nx = x + dir[i].x
                let ny = y + dir[i].y
                
                if nx < 0 || nx >= grid.count || ny < 0 || ny >= grid[0].count { continue }
                
                if visited[nx][ny] == true { continue }
                
                if grid[nx][ny] == 0 {
                    visited[nx][ny] = true
                    continue
                }
                
                recur(nx, ny)
            }
        }

        return max
    }
}
