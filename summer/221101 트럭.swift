let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let w = input[1]
let l = input[2]
// n: 트럭의 수, w: 다리 길이, l: 다리의 최대 하중

var trucks: [Int] = []
trucks.append(contentsOf: readLine()!.split(separator: " ").map { Int($0)! })

var bridge: [(weight: Int, entry: Int)] = []
var answer: Int = 0
var count: Int = 0

// 0번 차 / 무게 7이 올라간다
// bridge = [(7, 1)]
// 얘가 다리를 통과하는 시간 = 1 + l = 1 + 10 = 11
// 2번 차 / 무게 4가 올라간다
// bridge = [(4, 11)]
// 시간 += 1
// 3번 차 / 무게 5가 올라간다
// bridge = [(4, 11), (5, 12)]

//bridge.append((trucks[0], 1))
//count += 1

while count < n {
    answer += 1
    if bridge.count > 0, bridge[0].entry + w == answer { bridge.removeFirst() }
    let cur = bridge.reduce(0, { $0 + $1.weight })
    if cur + trucks[count] <= l {
        bridge.append((trucks[count], answer))
        count += 1
    }
//    print(answer, bridge)
}

answer += w

print(answer)
