class Solution {
    func grayCode(_ n: Int) -> [Int] {
        var result = [Int]()
        // (1 << 2 = 1 0 0 = 4 - 1 = 3 = 1 1)
        let max = (1 << n)
        var isValid = false
        var arr = [Int]()
        
        for i in 0..<max{
            if !isValid {
                result.append(i)
                recur(i)
            }
        }
        
        func recur(_ cur: Int) {
            if isValid { return }
            if result.count == max {
                let compare = result[0] ^ result[max - 1]
                if isXOR(compare) {
                    isValid = true
                    arr.append(contentsOf: result)
                }
                return
            }
                        
            for i in 0..<max {
                let compare = cur ^ i
                if !isXOR(compare) { continue }
                if result.contains(i) { continue }
                result.append(i)
                recur(i)
                result.removeLast()
            }
        }
        
        func isXOR(_ num: Int) -> Bool {
            return num != 0 && (num & (num - 1)) == 0
        }
        
        return arr
    }
}
