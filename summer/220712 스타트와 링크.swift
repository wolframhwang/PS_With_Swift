// BOJ 14889 스타트와 링크
// 축구를 모하기 위해 모인 사람 N명 (짝수, 4 <= N <= 20)
// 두 팀의 능력치의 차이가 최소화 되도록
// 능력치의 차이의 최솟값 출력

let size = Int(readLine()!)!

var map = Array(repeating: [Int](), count: size)
for i in 0..<size {
    map[i].append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })
}

var teamSize = size / 2
var players = Array(1...size)

func getSum(_ arr: [Int]) -> Int {
    var sum = 0
    for i in 0..<arr.count {
        for j in 0..<arr.count {
            let p1 = arr[i] - 1
            let p2 = arr[j] - 1
            sum += map[p1][p2]
            sum += map[p2][p2]
        }
    }
    
    return sum
}

var start = [Int]()
var link = [Int]()
var minGap = Int.max

func recur(_ idx: Int) {
    if start.count == teamSize && link.count == teamSize && idx == size {
        let startSum = getSum(start)
        let linkSum = getSum(link)
        
        let gap = abs(startSum - linkSum)
        if gap < minGap {
            minGap = gap
        }
    }
    
    if idx >= size { return }
    if start.count > teamSize || link.count > teamSize { return }
    
    start.append(players[idx])
    recur(idx + 1)
    start.removeLast()
    link.append(players[idx])
    recur(idx + 1)
    // start의 마지막 원소를 제거하기 전에, 먼저 link를 비워줘야 한다
    link.removeLast()
}

recur(0)
print(minGap)
