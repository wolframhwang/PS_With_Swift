class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var answer: [Int] = []
        var dict: [Int: Int] = [:]
        for num in nums {
            dict[num, default: 0] += 1
        }
        
        for (key, value) in dict.sorted { $0.value < $1.value } {
            answer.append(value)
            if answer.count == k { break }
        }
        return answer
    }
}
