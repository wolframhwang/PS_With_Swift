import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let limit = (queue1.count + queue2.count) * 3
    var sum1 = 0, sum2 = 0, f1 = 0, f2 = 0, q1 = queue1, q2 = queue2
    queue1.forEach { sum1 += $0 }; queue2.forEach { sum2 += $0 }
    var cnt = 0
    while cnt <= limit {
        if sum1 == sum2 {
            break
        }
        if sum1 < sum2 {
            sum1 += q2[f2]
            sum2 -= q2[f2]
            q1.append(q2[f2])
            f2 += 1
        } else {
            sum2 += q1[f1]
            sum1 -= q1[f1]
            q2.append(q1[f1])
            f1 += 1
        }
        cnt += 1
    }
    return cnt > limit ? -1 : cnt
}
