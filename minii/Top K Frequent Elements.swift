class Solution {
    var countArr: [Int: Int] = [:]
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        for num in nums {
            countArr[num, default: 0] += 1
        }
        let values = countArr.sorted(by: { $0.value > $1.value })
        
        var result: [Int] = []
        for idx in 0..<k {
            result.append(values[idx].key)
        }
        
        return result
    }
}

let sol = Solution()
print(sol.topKFrequent([1,1,1,2,2,3], 2))
