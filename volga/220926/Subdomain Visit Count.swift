class Solution {
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        var dict: [String: Int] = [:]
        var answer: [String] = []
        let dot: String = "."
        for domain in cpdomains {
            let domainInfo = domain.split(separator: " ").map { String($0) }
            let rep = Int(domainInfo[0])!
            var dom = domainInfo[1].split(separator: ".").map { String($0) }
            var dm: String = ""
            while !dom.isEmpty {
                if dm.count == 0 {
                    dm = dom.last!
                } else {
                    dm = dom.last! + dot + dm
                }
                dict[dm, default: 0] += rep
                dom.removeLast()                
            }
        }
        
        for (key, value) in dict {
            answer.append("\(value) \(key)")
        }

        return answer
    }
}
