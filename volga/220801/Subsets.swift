class Solution {
    var limit = 0
    var nums: [Int] = []
    var sets: [Int] = []
    var answer: [[Int]] = []
    func recur(_ now: Int) {
        if now == limit {
            answer.append(sets)
            return
        }
        
        recur(now + 1)
        sets.append(nums[now])
        recur(now + 1)
        sets.removeLast()
    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        limit = nums.count
        self.nums = nums
        
        recur(0)
        return answer
    }
}
