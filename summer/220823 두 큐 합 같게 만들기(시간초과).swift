// 시간초과
import Foundation

var targetSum = 0
var q1 = [Int](), q2 = [Int]()
var minCount = Int.max
var limit = 0

func getSum(_ arr: [Int]) -> Int {
    let sum = arr.reduce(0, +)
    return sum
}

// 매 선택 분기마다 큐1에서 뺄건지, 큐2에서 뺄건지 정한다
// 1번 방법: 큐에 계속 붙여나가고, 시작 인덱스를 전달해서 썸 계산
// 2번 방법: inout으로 어레이의 원소를 계속 변경해서 썸 계산
// 탈출조건?
func recur(_ arr1: inout [Int], _ arr2: inout [Int], _ sum1: Int, _ sum2: Int, _ count: Int) {
    print(arr1, arr2, count)
    if count > limit { return }
    if arr1.isEmpty || arr2.isEmpty { return }
    
    if targetSum == sum1 {
//        print(sum1, arr1, arr2, count)
        if count < minCount {
            minCount = count
        }
        return
    }
 
    var arr1Copy = arr1
    let add1 = arr1[0]
    arr2.append(arr1Copy.removeFirst())
    recur(&arr1Copy, &arr2, sum1 - add1, sum2 + add1, count + 1)
    arr2.removeLast()
    var arr2Copy = arr2
    let add2 = arr2[0]
    arr1.append(arr2Copy.removeFirst())
    recur(&arr1, &arr2Copy, sum1 + add2, sum2 - add2, count + 1)
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    let sum1 = getSum(queue1)
    let sum2 = getSum(queue2)
    targetSum = (getSum(queue1) + getSum(queue2)) / 2
    limit = (queue1.count) * 3
    q1 = queue1
    q2 = queue2
    
    if targetSum == getSum(queue1) { return 0 }
    
    recur(&q1, &q2, sum1, sum2, 0)
    
    if minCount == Int.max {
        return -1
    }
    
    return minCount
}

print(solution([1, 2, 1, 2], [1, 10, 1, 2]))
