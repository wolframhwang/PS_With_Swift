class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var comparator = 0
        
        for n in nums {
            comparator ^= n
        }
        return comparator
    }
}
