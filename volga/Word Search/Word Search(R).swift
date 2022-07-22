class Solution {
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]

    var map: [[Character]] = []
    var targetWord: [Character] = []
    var visit: [[[Bool]]] = []
    var isOK = false

    func recur(_ x: Int, _ y: Int, _ idx: Int, _ cnt: Int) {
        if idx >= targetWord.count {
            isOK = true            
            return
        }
        for i in 0..<4 {
            let nx = x + dx[i], ny = y + dy[i]
            if nx < 0 || nx >= map.count || ny < 0 || ny >= map[0].count { continue }
            if map[nx][ny] != targetWord[idx] { continue }
            if visit[cnt][nx][ny] { continue }
            visit[cnt][nx][ny] = true
            recur(nx, ny, idx + 1, cnt)
            visit[cnt][nx][ny] = false
        }
    }

    func exist(_ board: [[Character]], _ word: String) -> Bool {
        let N = board.count, M = board[0].count
        map = board
        visit = [[[Bool]]](repeating: 
                                    [[Bool]](repeating: 
                                                        [Bool](repeating: false, count: M), 
                                                        count: N), 
                                    count: M * N)
        for c in word { targetWord.append(c) }
        var numbering = 0
        for i in 0..<N {
            for j in 0..<M {
                if !isOK, map[i][j] == targetWord[0] {
                    visit[numbering][i][j] = true
                    recur(i, j, 1, numbering)
                    numbering += 1
                }
            }
        }
        return isOK
    }
}
