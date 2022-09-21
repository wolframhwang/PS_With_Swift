class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.isEmpty || matrix[0].isEmpty { return false }
        
        let m = matrix.count
        let n = matrix[0].count
        
        var row = 0
        var col = n - 1
        
        while row < m && col >= 0 {
            if matrix[row][col] == target { return true }
            if matrix[row][col] < target { row += 1 }
            else if matrix[row][col] > target { col -= 1 }
        }
        
        return false
    }
}
