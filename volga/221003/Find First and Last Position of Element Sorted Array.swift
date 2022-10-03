class Solution {
    var nums : [Int] = []
    func lowerBound(_ target: Int) -> Int {
        var s = 0, e = nums.count
        
        while s < e {
            let m = (s + e) / 2
            if nums[m] < target {
                s = m + 1
            } else {
                e = m
            }
        }
        return e
    }
    
    func upperBound(_ target: Int) -> Int {
        var s = 0, e = nums.count
        
        while s < e {
            let m = (s + e) / 2
            if nums[m] <= target {
                s = m + 1
            } else {
                e = m
            }
        }
        return e
    }
    
    func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
        self.nums = nums
        let s = lowerBound(target)
        let e = upperBound(target) - 1

        if s > e { return [-1,-1]}
        return [s, e]
    }
}
