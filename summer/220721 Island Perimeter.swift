func islandPerimeter(_ grid: [[Int]]) -> Int {
    let row = grid.count
    let col = grid[0].count
    var result = 0
    
    var visited = Array(repeating: Array(repeating: false, count: col), count: row)
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    func recur(_ x: Int, _ y: Int) {
        visited[x][y] = true
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
        
            if nx < 0 || nx >= row || ny < 0 || ny >= col {
                result += 1
                continue
            }
            
            if grid[nx][ny] == 0 {
                result += 1
                continue
            }
            
            if visited[nx][ny] == true {
                continue
            }
            
            if visited[nx][ny] == false {
                recur(nx, ny)
            }
        }
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if visited[i][j] == true { continue }
            visited[i][j] = true
            if grid[i][j] == 1 {
                recur(i, j)
            }
        }
    }
    
    print(result)
    return result
}
