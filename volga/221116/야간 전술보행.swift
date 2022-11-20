import Foundation

func solution(_ distance:Int, _ scope:[[Int]], _ times:[[Int]]) -> Int {
    var answer = distance
    for i in 0..<scope.count {
        let se = scope[i].sorted { $0 < $1 }
        var s = se[0], e = se[1]
        let work = times[i][0], rest = times[i][1]
        while s <= e {
            let value = s % (work + rest)
            if 0 < value, value <= work {
                answer = min(answer, s)
            }
            s += 1
        }
    }
    return answer
}
