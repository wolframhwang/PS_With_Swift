
let AA = readLine()!.split(separator: " ").map{ Int($0)! }
let A = AA[0], B = AA[1]
var matA: [[Int]] = []
for _ in 0..<A {
    matA.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

let CC = readLine()!.split(separator: " ").map { Int($0)! }
let C = CC[0], D = CC[1]
var matB: [[Int]] = []
for _ in 0..<B {
    matB.append(readLine()!.split(separator: " ").map{ Int($0)! })
}
var answer: [[Int]] = []

for x in 0..<A {
    var arr: [Int] = []
    for i in 0..<D {
        var num = 0
        for j in 0..<C {
            num += matA[x][j] * matB[j][i]
        }
        arr.append(num)
    }
    answer.append(arr)
}

answer.forEach { ans in
    ans.forEach { e in
        print(e, terminator: " ")
    }
    print()
}
