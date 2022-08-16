import Foundation

var place = [[String]]()
let dr = [0, 1]
let dc = [1, 0]
var temp = [Character]()


func isValid(_ room: [String]) -> Bool {
    var arr = Array(repeating: [Character](), count: 5)
    
    for i in 0..<5 {
        arr[i].append(contentsOf: Array(room[i]))
    }
    
    for i in 0..<5 {
        for j in 0..<5 {
            if arr[i][j] != "P" { continue }
            
            for d in 0..<2 {
                let nr = i + dr[d]
                let nc = j + dc[d]
                
                if nr >= 5 || nc >= 5 { continue }
                
                if arr[nr][nc] == "P" { return false }
            }
            
            if j < 3 {
                temp.append(arr[i][j + 1])
                temp.append(arr[i][j + 2])
                if !checkValidity() { return false }
            }
            
            if i < 3 {
                temp.append(arr[i + 1][j])
                temp.append(arr[i + 2][j])
                if !checkValidity() { return false }
            }
            
            if i < 4 && j < 4 {
                temp.append(arr[i][j + 1])
                temp.append(arr[i + 1][j + 1])
                if !checkValidity() { return false }
                
                temp.append(arr[i + 1][j])
                temp.append(arr[i + 1][j + 1])
                if !checkValidity() { return false }
            }
            
            if i > 0 && j < 4 {
                temp.append(arr[i - 1][j])
                temp.append(arr[i - 1][j + 1])
                if !checkValidity() { return false }
                
                temp.append(arr[i][j + 1])
                temp.append(arr[i - 1][j + 1])
                if !checkValidity() { return false }
            }
        }
    }
    
    return true
}

func checkValidity() -> Bool {
    if temp.removeLast() == "P" {
        if temp.removeLast() == "O" { return false }
    } else {
        temp.removeLast()
    }
    
    return true
}

func solution(_ places:[[String]]) -> [Int] {
    place = places
    var result = [Int]()
    
    for room in places {
        if isValid(room) { result.append(1) }
        else { result.append(0) }
    }
    
//    print(result)
    return result
}
