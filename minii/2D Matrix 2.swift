class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var isCorrect: Bool = false
        
        for row in 0..<matrix.count {
            for col in 0..<matrix[row].count {
                if matrix[row][col] == target {
                    isCorrect = true
                    break
                }
            }
        }
        
        
        return isCorrect
    }
}

let matrix = [[1,4,7,11,15],[2,5,8,12,19],[3,6,9,16,22],[10,13,14,17,24],[18,21,23,26,30]]
let target = 20

let sol = Solution()
print(sol.searchMatrix(matrix, target))
