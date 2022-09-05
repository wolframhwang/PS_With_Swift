let NM = readLine()!.split(separator: " ").compactMap{Int($0)}
let N = NM[0]
let M = NM[1]
let sorted = readLine()!.split(separator: " ").compactMap{Int($0)}.sorted()
var str = ""
var arr = [Int]()

func recur(depth: Int, str: String) {
    if depth == M {
        print(str)
        return
    } else if depth == 0 {
        for i in 0..<N {
            arr.append(sorted[i])
            recur(depth: depth + 1, str: str + "\(sorted[i]) ")
            arr.removeLast()
        }
    } else {
        for i in 0..<N {
            if arr.last! >= sorted[i] { continue }
            arr.append(sorted[i])
            recur(depth: depth + 1, str: str + "\(sorted[i]) ")
            arr.removeLast()
        }
    }
}
recur(depth: 0, str: "")
