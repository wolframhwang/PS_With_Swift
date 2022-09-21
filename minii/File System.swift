class Solution {
    var result: [String: [String]] = [:]

    func findDuplicate(_ paths: [String]) -> [[String]] {
        for path in paths {
            solveDir(path, &result)
        }
        return Array(result.values.filter { $0.count > 1 })
    }
    
    func solveDir(_ path: String, _ result: inout [String: [String]]) {
        var map = path.split(separator: " ")
        let dir = map.removeFirst() + "/"
        
        for index in 0..<map.count {
            map[index].removeLast()
            let values = map[index].split(separator: "(")
            let file = values[0], id = values[1]
            result[String(id), default: []] += [String(dir + file)]
        }
    }
 }


let paths = ["root/a 1.txt(abcd) 2.txt(efgh)","root/c 3.txt(abcd)","root/c/d 4.txt(efgh)","root 4.txt(efgh)"]

let sol = Solution()
print(sol.findDuplicate(paths))
