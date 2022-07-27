import Foundation

func solveNQueens(_ n: Int) -> [[String]] {
    var board = Array(repeating: Array(repeating: ".", count: n), count: n)
    var result = [[String]]()
    
    for i in 0..<n {
        board[0][i] = "Q"
//        print("firstcol:", i)
//        print(board)
        placeQueen(1)
        board[0][i] = "."
    }
    
    // 둘째줄: (-1, -1), (-1, 0), (-1, 1)
    // 셋째줄: 둘째줄 + (-2, -2), (-2, 0), (-2, 2)ㄹㅇ
    
    // idx: 현재 퀸을 놓고자 하는 행
    func placeQueen(_ idx: Int) {
//        print("idx: \(idx)")
        if idx == n {
            var success = [String]()
            for line in board {
                success.append(line.joined())
            }
//            print(success)
            result.append(success)
            return
        }
        
        for col in 0..<n {
            if check(col) {
                // 조건을 만족하는 열에 퀸을 놓는다
                // -> 퀸을 한 행에 두 개 놓으면 안되니까 여기서 탈출하거나 다음 행으로 recur해야 함
                board[idx][col] = "Q"
//                print(board)
                // 다음 행의 퀸 찾기로 들어간다
                placeQueen(idx + 1)
                // 먼저 놓았던 퀸 제거
                board[idx][col] = "."
            }
        }
        
        // col: 퀸을 놓고 싶은 열
        func check(_ col: Int) -> Bool {
            var noQ = true
            // row: 퀸이 있는지 확인하고 싶은 이전 행
            for row in 0..<idx {
                let gap = idx - row
//                print("idx:",idx, "[\(row)]", "[\(col)]")
                if board[row][col] == "Q" { noQ =  false }
                if col - gap >= 0 && board[row][col - gap] == "Q" { noQ = false }
                if col + gap < n && board[row][col + gap] == "Q" { noQ = false }
            }
            return noQ
        }
    }

    
    print(result)
    return result
}


solveNQueens(4)
