let input = readLine()!.split(separator: " ").compactMap{Int($0)}
let maxNum = input[0]
let limit = input[1]
var arr = [Int]()
var str = ""
func recur() {
    if arr.count == limit {
        str += arr.map{String($0)}.joined(separator: " ")
        str += "\n"
        return
    }
    
    for i in 1...maxNum {
        arr.append(i)
        recur()
        arr.removeLast()
    }
}

recur()
print(str)
