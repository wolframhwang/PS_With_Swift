class Solution {
    func findDuplicate(_ paths: [String]) -> [[String]] {
        var dict: [String: [String]] = [:]
        var answer = [[String]]()
        
        // dictionary 쓰면 될 것 같음
        // key: (abcd)
        // value: 디렉토리 + 파일명
        
        for str in paths {
            var arr = str.components(separatedBy: " ")
            let dir = arr.removeFirst()
            
            for file in arr {
                var sep = file.components(separatedBy: "(")
                let filename = sep[0]
                var content = sep[1]
                content.removeLast()
                
                let path = dir + "/" + filename
                dict[content, default: []].append(path)
            }
        }
                
        for (key, value) in dict {
            if dict[key, default: []].count >= 2 {
                var arr = [String]()
                arr.append(contentsOf: dict[key, default: []])
                answer.append(arr)
            }
        }
        
        return answer
    }
}
