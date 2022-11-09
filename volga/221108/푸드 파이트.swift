import Foundation

func solution(_ food:[Int]) -> String {
    var answer: String = ""
    var redSideFighter: [Int] = []
    var blueSideFighter: [Int] = []

    for i in 1..<food.count {
        var fdA = food[i]
        while fdA >= 2 {
            redSideFighter.append(i)
            blueSideFighter.append(i)
            fdA -= 2
        }
    }

    redSideFighter.append(0)
    while !blueSideFighter.isEmpty {
        redSideFighter.append(blueSideFighter.last!)
        blueSideFighter.removeLast()
    }

    for n in redSideFighter {
        answer += String(n)
    }

    return answer
}
