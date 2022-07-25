let t = Int(readLine()!)!

for _ in 0..<t {
    let NM = readLine()!.split(separator: " ").map { Int($0)! }
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    solution(NM[0], NM[1], arr)
}

func solution(_ N: Int, _ M: Int, _ arr: [Int]) {
    var ret = 1
    var priority = [Int](repeating: 0, count: 10)
    var q: [(val: Int, i: Int)] = []
    var front = 0, rear = 0
    for n in 0..<arr.count {
        priority[arr[n]] += 1
        q.append((arr[n], n))
    }

    for i in (1...9).reversed() {
        while priority[i] > 0 {
            let f = q[front]
            front += 1
            if f.val == i, f.i == M {
                print(ret)
                return
            }
            if f.val == i {
                ret += 1
                priority[i] -= 1
            }
            if f.val != i {
                q.append(f)
            }
        }
    }
}
