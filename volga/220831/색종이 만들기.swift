let N = Int(readLine()!)!

var map: [[Int]] = []

for _ in 0..<N {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var answer: [Int] = [0, 0]

func divide(_ len: Int, _ x: Int, _ y: Int) {
    if len == 1 {
        answer[map[x][y]] += 1
        return
    }
    let val = map[x][y]
    var paper = false

    for i in 0..<len {
        for j in 0..<len {
            if map[x + i][y + j] != val {
                paper = true
                break
            }
        }
        if paper { break }
    }
    if paper {
        let newLen = len / 2
        divide(newLen, x, y)
        divide(newLen, x + newLen, y + newLen)
        divide(newLen, x + newLen, y)
        divide(newLen, x, y + newLen)
    } else {
        answer[val] += 1
    }
}
divide(N, 0, 0)
print(answer[0])
print(answer[1])
