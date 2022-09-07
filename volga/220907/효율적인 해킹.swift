let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
let N = NM[0], M = NM[1]

var map: [[Int]] = [[Int]](repeating: [], count: N + 1)

for _ in 0..<M {
    let AB = readLine()!.split(separator: " ").map { Int(String($0))! }
    map[AB[1]].append(AB[0])
}

var visit = [Int](repeating: 0, count: N + 1)
var cnt = 0

func recur(_ now: Int, _ cntt: Int, _ v: inout [Int], _ c: inout Int, _ m: inout [[Int]]) {
    v[now] = cntt
    c += 1
    
    m[now].forEach { next in
        if v[next] != cntt {
            recur(next, cntt, &v, &c, &m)
        }
    }
}
var maxx = 0
var answer: [Int] = []

for i in 1...N {
    cnt = 0
    recur(i, i, &visit, &cnt, &map)
    if cnt == maxx {
        answer.append(i)
    }
    if cnt > maxx {
        maxx = cnt
        answer = [i]
    }
}


answer.forEach { ans in
    print("\(ans)", terminator: " ")
}
