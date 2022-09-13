let people = Int(readLine()!)!
let target = readLine()!.split(separator: " ").map { Int($0)! }
let one = target[0]
let two = target[1]
let edges = Int(readLine()!)!

var map = [Int: Int]()

for _ in 0..<edges {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = input[0]
    let child = input[1]
    
    map[child, default: child] = parent
}

var parentOne: [Int] = [one]

func findParentOne(_ cur: Int) {
    if map[cur] == cur { return }
    
    if map[cur] == nil { return }
    else {
        parentOne.append(map[cur]!)
        findParentOne(map[cur]!)
    }
}

var parentTwo: [Int] = [two]

func findParentTwo(_ cur: Int) {
    if map[cur] == cur { return }
    
    if map[cur] == nil { return }
    else {
        parentTwo.append(map[cur]!)
        findParentTwo(map[cur]!)
    }
}

func compare(_ arr1: [Int], _ arr2: [Int]) {
    var answer = Int.max
    
    for i in 0..<arr1.count {
        for j in 0..<arr2.count {
            if arr1[i] == arr2[j] {
                answer = min(answer, i + j)
            }
        }
    }
    
    if answer == Int.max {
        print(-1)
    } else {
        print(answer)
    }
}

findParentOne(one)
findParentTwo(two)
compare(parentOne, parentTwo)
