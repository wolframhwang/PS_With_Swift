class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var dict: [String: Int] = [:]
        
        for cp in cpdomains {
            let arr = cp.split(separator: " ").map { String($0) }
            let rep = Int(arr[0])!
            var domain = arr[1]
            dict[domain, default: 0] += rep
            
            while domain.contains(".") {
                if let i = domain.firstIndex(of: ".") {
                    domain.removeSubrange(domain.startIndex...i)
                    dict[domain, default: 0] += rep
                }
            }
        }
        
        var result: [String] = []
        for (key, value) in dict {
            let str = String(value) + " " + key
            result.append(str)
        }
        
        return result
    }
}
