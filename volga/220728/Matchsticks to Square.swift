/*
1 <= matchsticks.length <= 15
1 <= matchsticks[i] <= 108
*/

class Solution {    
    func makesquare(_ matchsticks: [Int]) -> Bool {
        if matchsticks.count < 4 { return false }
        var sum = 0
        matchsticks.forEach { match in
            sum += match
        }
        if sum % 4 != 0 { return false }
        var limit = sum / 4
        var nodes: [Int] = [0,0,0,0]
        var matchs = matchsticks.sorted {$0 > $1}
        func recur(_ idx: Int) -> Bool {
            if idx == matchsticks.count {
                return nodes[0] == limit && nodes[1] == limit && nodes[2] == limit
            }
            let element = matchs[idx]
            for i in 0..<4 {
                if nodes[i] + element <= limit {
                    nodes[i] += element
                    if recur(idx + 1) {
                        return true
                    }
                    nodes[i] -= element
                }
            }
            return false        
        }

        return recur(0)
    }
}
