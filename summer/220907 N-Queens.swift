class Solution {
    var size = 0
    lazy var visited = Array(repeating: Array(repeating: 0, count: size), count: size)
    lazy var board = Array(repeating: Array(repeating: ".", count: size), count: size)
    var result = [[String]]()
    
    func markHorVer(_ row: Int, _ col: Int, _ by: Int) {
        for i in 0..<size {
            if i == row && i == col { continue }
            visited[i][col] += by
            visited[row][i] += by
        }
    }
    
    let dr = [1, 1, -1, -1]
    let dc = [1, -1, 1, -1]
    func markDiagonal(_ row: Int, _ col: Int, _ by: Int) {
        for i in 0..<4 {
            for num in 1..<size {
                let nr = row + dr[i] * num
                let nc = col + dc[i] * num

                if nr < 0 || nr >= size || nc < 0 || nc >= size { continue }
                visited[nr][nc] += by
            }  
        }
    }

    func place(_ row: Int, _ col: Int) {
        if row == size && col == 0 {
            var suc = [String]()
            for i in 0..<size {
                suc.append(board[i].joined())
            }
            result.append(suc)
            return
        } else if row == size { return }
        
        if visited[row][col] != 0 { return }
        visited[row][col] += 1
        board[row][col] = "Q"
        markHorVer(row, col, 1)
        markDiagonal(row, col, 1)

        for i in 0..<size {
            place(row + 1, i)
        }
        
        visited[row][col] -= 1
        board[row][col] = "."
        markHorVer(row, col, -1)
        markDiagonal(row, col, -1)
    }
    
    func solveNQueens(_ n: Int) -> [[String]] {
        self.size = n
        
        for i in 0..<size {
            place(0, i)
        }
        return result
    }
}
