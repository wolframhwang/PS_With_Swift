class Solution {
    func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
        var res: Int = 0
        var nums = nums
        recur(0, target, &nums, res: &res)
 
        return res
    }
    
    func recur(_ index: Int, _ targetNumber: Int, _ numbers: inout [Int], res: inout Int) {

        if index == numbers.count {
            if numbers.reduce(0, +) == targetNumber {
                res += 1
            }
            return
        }
        
        for _ in 0...1 {
            let target = numbers[index]
            numbers[index] = -target
            recur(index + 1, targetNumber, &numbers, res: &res)
            numbers[index] = -target
        }
    }
}

extension Int {
    var opt: Bool {
        if self == 1 {
            return true
        } else {
            return false
        }
    }
}

let sol = Solution()
let res = sol.findTargetSumWays([1,1,1,1,1], 3)
print("result :",res)
