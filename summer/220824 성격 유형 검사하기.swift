import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result: Dictionary<Character, Int> = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    
    for i in 0..<survey.count {
        let str = Array(survey[i])
        let ele1 = str[0]
        let ele2 = str[1]
        
        let score = choices[i]
        switch score {
        case 1:
            result[ele1, default: 0] += 3
        case 2:
            result[ele1, default: 0] += 2
        case 3:
            result[ele1, default: 0] += 1
        case 5:
            result[ele2, default: 0] += 1
        case 6:
            result[ele2, default: 0] += 2
        case 7:
            result[ele2, default: 0] += 3
        default:
            break
        }
    }
    
    var answer = ""
    if result["R", default: 0] >= result["T", default: 0] {
        answer += "R"
    } else {
        answer += "T"
    }
    
    if result["C", default: 0] >= result["F", default: 0] {
        answer += "C"
    } else {
        answer += "F"
    }
    
    if result["J", default: 0] >= result["M", default: 0] {
        answer += "J"
    } else {
        answer += "M"
    }
    
    if result["A", default: 0] >= result["N", default: 0] {
        answer += "A"
    } else {
        answer += "N"
    }
    
    return answer
}
