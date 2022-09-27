class Solution {
    var countMap: [String: Int] = [:]
    func subdomainVisits(_ cpdomains: [String]) -> [String] {
        
        for domain in cpdomains {
            let value = domain.split(separator: " ")
            let count = value[0]
            let origin = value[1]
            
            countMap[origin.description, default: 0] += Int(count)!
            
            checkDomain(origin.description, Int(count)!)
        }
        return countMap.map { "\($0.value) \($0.key)"}
    }
    
    func checkDomain(_ domain: String, _ count: Int) {
        var domains = domain.split(separator: ".")
        domains.removeFirst()
        
        let lastValue = domains.last!
        
        for d in domains {
            var key = lastValue
            
            if d != lastValue {
                key = d + "." + lastValue
            }
            
            countMap[String(key), default: 0] += count
        }

    }
}
