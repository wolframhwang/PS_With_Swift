class Solution {
    var arr: [Int] = []
    var mask = 0
    var memo: [Int: Bool] = [:]
    
    func backtrack(_ index: Int, _ count: Int, _ currentSum: Int, _ k: Int, _ targetSum: Int) -> Bool {
        let n = arr.count
      
        if count == k - 1 {
            return true;
        }
        if currentSum > targetSum {
            return false;
        }
      
        if (memo[mask] != nil) {
            return memo[mask, default: false];
        }
        
        if (currentSum == targetSum) {
            memo[mask] = backtrack(0, count + 1, 0, k, targetSum)
            return memo[mask, default: false]
        }
        
        for j in index..<n {
            if (((mask >> j) & 1) == 0) {
                mask = (mask | (1 << j));
                
                if (backtrack(j + 1, count, currentSum + arr[j], k, targetSum)) {
                    memo[mask] = true;
                    return memo[mask, default: false]
                }
                
                mask = (mask ^ (1 << j));
            }
        }
        memo[mask] = false
        return memo[mask, default: false]
    }
    
    func canPartitionKSubsets(_ nums: [Int], _ k: Int) -> Bool {
        let n = nums.count
        var totalArraySum = 0
        
        for i in 0..<n {
             totalArraySum += nums[i];
        }
      
        if totalArraySum % k != 0 {
            return false;
        }
      
        arr = nums.sorted { $0 > $1 }
        
        let targetSum = totalArraySum / k;
            
        return backtrack(0, 0, 0, k, targetSum);
        
    }
}
