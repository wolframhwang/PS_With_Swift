class Solution {
    func updateBoard(_ board: [[Character]], _ click: [Int]) -> [[Character]] {
        var result = board
        let r = click[0]
        let c = click[1]
        
        if board[r][c] == "M" {
            result[r][c] = "X"
            return result
        }
        
        let dir = [(x: 0, y: 1), (x: 0, y: -1), (x: 1, y: 0), (x: 1, y: -1), (x: 1, y: 1), (x: -1, y: 0), (x: -1, y: -1), (x: -1, y: 1)]
        
        let m = board.count
        let n = board[0].count
        var visited = Array(repeating: Array(repeating: false, count: n), count: m)

        var queue = [(row: r, col: c)]
        func recur(_ x: Int, _ y: Int) {
            queue.removeFirst()
            if visited[x][y] == true { return }

            if board[x][y] != "E" { return }
            visited[x][y] = true
            var bombs = 0
            var arr = [(row: Int, col: Int)]()
            
            for i in 0..<8 {
                let nx = x + dir[i].x
                let ny = y + dir[i].y

                if nx < 0 || nx >= m || ny < 0 || ny >= n { continue }
                if visited[nx][ny] == true { continue }
                
                if board[nx][ny] == "M" {
                    bombs += 1
                    continue
                }
                
                arr.append((row: nx, col: ny))
            }
            
            if bombs > 0 {
                result[x][y] = Character(String(bombs))
            } else {
                result[x][y] = "B"
                queue.append(contentsOf: arr)
            }
        }

        while !queue.isEmpty {
            recur(queue[0].row, queue[0].col)
        }
        
        return result
    }
}
