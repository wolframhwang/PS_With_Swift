let TC = Int(readLine()!)!

for _ in 0..<TC {
    let NM = readLine()!.split(separator: " ").map { Int($0)! }
    let N = NM[0], M = NM[1]

    print(solution(N, M))
}

func solution(_ N: Int, _ M: Int) -> Int {
    let inputArray = readLine()!.split(separator: " ").map { Int($0)! }
    var importances = [Int](repeating: 0, count: 10)
 
    var q: [(value: Int, index: Int)] = []
    var front = 0, startImportance = 0, idx = 0
    var ret = 0
    
    for importance in inputArray {
        importances[importance] += 1
        startImportance = max(startImportance, importance)
        q.append((importance, idx))
        idx += 1
    }

    while true {
        if front == q.count { break }
        let now = q[front]
        front += 1
        
        if now.value == startImportance {
            ret += 1
            if now.index == M {
                return ret
            }

            importances[startImportance] -= 1
            if importances[startImportance] == 0 {
                while startImportance > 0, importances[startImportance] == 0 {
                    startImportance -= 1
                }
            }
        } else {
            q.append(now)
        }
    }

    return ret
}
