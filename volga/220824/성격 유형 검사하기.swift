import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var result: [Character: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
    
    for i in 0..<survey.count {
        let arr = Array(survey[i])
        let l = arr[0]
        let r = arr[1]
        
        if choices[i] - 4 > 0 {
            result[r, default: 0] += choices[i] - 4
        } else if choices[i] - 4 < 0 {
            result[l, default: 0] += 4 - choices[i]
        }
    }
    
    var answer: String = ""
    
    answer += result["R", default: 0] >= result["T", default: 0] ? "R" : "T"
    answer += result["C", default: 0] >= result["F", default: 0] ? "C" : "F"
    answer += result["J", default: 0] >= result["M", default: 0] ? "J" : "M"
    answer += result["A", default: 0] >= result["N", default: 0] ? "A" : "N"
    
    return answer
}
