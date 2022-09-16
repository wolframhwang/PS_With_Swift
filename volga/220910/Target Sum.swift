class Solution {
    var nums: [Int] = []
    var target: Int = 0, answer = 0, end = 0
    var dict: [Int: Int] = [:]
    
    func recur(_ sum: Int, _ idx: Int) {
        if idx == end {
            dict[sum, default: 0] += 1
            return
        }
        recur(sum + nums[idx], idx + 1)
        recur(sum - nums[idx], idx + 1)
    }
    
    func recur2(_ sum: Int, _ idx: Int) {
        if idx == end {
            answer += dict[target - sum, default: 0]
            return
        }
        recur2(sum + nums[idx], idx + 1)
        recur2(sum - nums[idx], idx + 1)
    }
    
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        self.nums = nums
        self.target = target
        end = nums.count
        recur(0, nums.count / 2)// 5 [0, 1], [2, 3,4]
        end = nums.count / 2
        recur2(0, 0)
        return self.answer
    }
}
