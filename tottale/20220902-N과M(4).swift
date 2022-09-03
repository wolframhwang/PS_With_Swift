let input = readLine()!.split(separator: " ").compactMap{Int($0)}
let maxNum = input[0]
let depth = input[1]
var arr = [Int]()
var str = ""

func recur(_ n : Int) {
    
    if arr.count == depth {
        str += arr.map{String($0)}.joined(separator: " ")
        str += "\n"
        return
    }
    for i in n...maxNum {
        arr.append(i)
        recur(i)
        arr.removeLast()
    }
}

recur(1)
print(str)
