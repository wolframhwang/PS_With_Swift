let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var arr = [Int]()

func recur(_ count: Int, _ idx: Int) {
    if count == m {
        arr.forEach{ print($0, terminator: " ")}
        print("")
        return
    }
    
    if idx > n { return }

    
    for i in idx...n {
        arr.append(i)
        recur(count + 1, i + 1)
        arr.removeLast()
    }
}

recur(0, 1)
