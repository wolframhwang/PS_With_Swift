import Foundation

class Solution {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        var start = 0
        var end = matrix[0].count - 1
        for i in 0..<matrix.count{
            if matrix[i][0] == target{
                return true
            }
            if matrix[i][0] > target {
                continue
            }
            start = 0
            end = matrix[0].count - 1
            while start <= end {
                let mid = (start + end) / 2
                if matrix[i][mid] > target {
                    end = mid - 1
                }else if matrix[i][mid] < target {
                    start = mid + 1
                }else {
                    return true
                }
            }
        }
        return false
    }
}
