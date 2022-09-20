class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        for path in paths {
            let p = path.split(separator: " ").map { String($0) }
            
            let dir = p[0]
            
            for i in stride(from: 1, to: p.count, by: 1) {
                let file = p[i]
                guard let parenthese = file.firstIndex(of: "(") else { continue }
                let filePath = dir + "/" + file[..<parenthese]
                let startIndex = file.index(after: parenthese)
                let endIndex = file.index(before: file.endIndex)
                let content = String(file[startIndex..<endIndex])
                map[content, default: []].append(filePath)
            }
        }
        var answer = [[String]]()
        for (k, v) in map {
            if v.count > 1 {
                answer.append(v)
            }
        }
        return answer
    }
 }
