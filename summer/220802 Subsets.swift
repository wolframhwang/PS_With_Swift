class Solution {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result = [[Int]]()
        var arr = [Int]()

        for limit in 0...nums.count {
            recur(limit, 0, 0)
        }
        
        func recur(_ limit: Int, _ count: Int, _ idx: Int) {
            if count == limit {
                result.append(arr)
                return
            }
            
            if idx >= nums.count { return }
            
            arr.append(nums[idx])
            recur(limit, count + 1, idx + 1)
            arr.removeLast()
            recur(limit, count, idx + 1)
        }
        
        return result
    }
}
