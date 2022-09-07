var set = Set<Int>()
var otherSet = Set<Int>()
var arr = [[Int]]()
var minCnt = 0
var cnt = 0
var minArr = [Int]()

let nm = readLine()!.split(separator: " ").compactMap{ Int($0) }
let n = nm[0]
let m = nm[1]

for i in 1...n {
    set.insert(i)
}
otherSet = set

for _ in 0..<m {
    let com = readLine()!.split(separator: " ").compactMap{ Int($0) }
    arr.append(com)
}

func recur(depth: Int) {
    if set.isEmpty {
        if cnt <= minCnt {
            set = otherSet
            cnt = 0
            print(minArr)
            return
        } else {
            set = otherSet
            cnt = 0
            minArr = []
            return
        }
    }
    
    for i in 0..<arr.count {
        if set.contains(arr[i][1]) {
            minArr.append(arr[i][1])
            set.remove(arr[i][0])
            set.remove(arr[i][1])
            cnt += 1
            recur(depth: depth + 1)
        }
    }
}

recur(depth: 1)
