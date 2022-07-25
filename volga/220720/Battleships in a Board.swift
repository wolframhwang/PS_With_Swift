class Solution {
    var map: [[Character]] = []
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    func recur(_ x: Int, _ y: Int) {
        map[x][y] = "."
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= map.count || ny < 0 || ny >= map[0].count {
                continue
            }
            if map[nx][ny] == "." { continue }
            recur(nx, ny)
        }
    }

    func countBattleships(_ board: [[Character]]) -> Int {
        map = board
        let N = board.count
        let M = board[0].count

        var answer = 0
        for i in 0..<N {
            for j in 0..<M {
                if map[i][j] == "X" {
                    recur(i, j)
                    answer += 1
                }
            }
        }

        return answer
    }
}
