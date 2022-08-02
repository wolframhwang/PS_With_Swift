class Solution {
    var answer: [Int] = []
    var binary : [Character] = []
    var n = 0
    var visit: [Int: Bool] = [:]
    func convertor() -> Int {
        var ret: String = ""
        for c in binary {
            ret += String(c)
        }
        return Int(ret, radix: 2)!
    }

    func recur() {
        let converted = convertor()
        if !visit[converted, default: false] {
            visit[converted] = true
            answer.append(converted)
        } else { return }
        
        
        for i in 0..<n {
            if binary[i] == "0" {
                binary[i] = "1"
                recur()
                binary[i] = "0"
            } else {
                binary[i] = "0"
                recur()
                binary[i] = "1"
            }
        }
    }

    func grayCode(_ n: Int) -> [Int] {
        self.n = n
        binary = [Character](repeating: "0", count: n)
        recur()
        
        return answer
    }
}
