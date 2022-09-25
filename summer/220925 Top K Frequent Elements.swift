class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var dic = [Int: Int]()
        
        for num in nums {
            dic[num, default: 0] += 1
        }
        
        var frequency = Array(repeating: [Int](), count: nums.count + 1)

        for (key, value) in dic {
            frequency[value].append(key)
        }
        
        var result = [Int]()
        
        for i in stride(from: nums.count, to: 0, by: -1) {
            if frequency[i].isEmpty { continue }
            result.append(contentsOf: frequency[i])
            if result.count == k { break }
        }
        
        return result
    }
}
