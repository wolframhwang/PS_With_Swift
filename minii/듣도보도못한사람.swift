import Foundation

/*
 듣도 못한 사람과 보도 못한 사람 명단이 주어짐.
 듣지도 못하고 보지도 못한 사람의 명단을 작성한다.
 */

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0], m = NM[1]

var listenMap: Set<String> = []
var seeMap: Set<String> = []

for _ in 0..<n {
    listenMap.insert(readLine()!)
}

for _ in 0..<m {
    seeMap.insert(readLine()!)
}

let result = Array(listenMap.intersection(seeMap))
print(result.count)
result.sorted(by: <).forEach {
    print($0)
}
