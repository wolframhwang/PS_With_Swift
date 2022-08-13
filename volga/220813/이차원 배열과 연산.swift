
let rck = readLine()!.split(separator: " ").map { Int($0)! }
let r = rck[0] - 1, c = rck[1] - 1, k = rck[2]
var R = 3, C = 3
var A: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: 100), count: 100)

for i in 0..<3 {
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }
    for j in 0..<3 {
        A[i][j] = arr[j]
    }
}

func operateR() {
    let cc = C
    C = 0
    for i in 0..<R {
        var ap: [Int: Int] = [:]
        for j in 0..<cc {
            if A[i][j] == 0 { continue }
            ap[A[i][j], default: 0] += 1
        }
        let arr = ap.sorted {
            if $0.value == $1.value { return $0.key < $1.key }
            return $0.value < $1.value
        }.map { (x: $0.key, y: $0.value) }
        
        var index = 0, k = 0
        while index < 100, k < arr.count {
            A[i][index] = arr[k].x
            index += 1
            A[i][index] = arr[k].y
            index += 1
            k += 1
        }
        for j in index..<100 {
            A[i][j] = 0
        }
        C = max(C, index)
    }
}

func operateC() {
    let rr = R
    R = 0
    for i in 0..<C {
        var ap: [Int: Int] = [:]
        for j in 0..<rr {
            if A[j][i] == 0 { continue }
            ap[A[j][i], default: 0] += 1
        }
        
        let arr = ap.sorted {
            if $0.value == $1.value { return $0.key < $1.key }
            return $0.value < $1.value
        }.map { (x: $0.key, y: $0.value) }
        
        var index = 0, k = 0
        while index < 100, k < arr.count {
            A[index][i] = arr[k].x
            index += 1
            A[index][i] = arr[k].y
            index += 1
            k += 1
        }
        for j in index..<100 {
            A[j][i] = 0
        }
        R = max(R, index)
    }
}

var times = 0
while A[r][c] != k {
    if times > 100 { break }
    if R >= C {
        operateR()
    } else {
        operateC()
    }
    times += 1
}

times = times > 100 ? -1: times
print(times)
