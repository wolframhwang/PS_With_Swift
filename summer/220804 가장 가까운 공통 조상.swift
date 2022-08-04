import Foundation

let cases = Int(readLine()!)!

for i in 0..<cases {
    let nodes = Int(readLine()!)!

    // child: parent
    var tree = [Int: Int]()

    for _ in 1..<nodes {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let parent = input[0]
        let child = input[1]
        
        tree[child, default: child] = parent
    }

    let targetNodes = readLine()!.split(separator: " ").map { Int($0)! }
    let nodeOne = targetNodes[0]
    let nodeTwo = targetNodes[1]

    var parentOne = [Int]()

    func findParentsOne(_ node: Int) {
        parentOne.append(node)
        guard let parent = tree[node] else {
            return
        }
        findParentsOne(parent)
    }

    findParentsOne(nodeOne)

    var parentTwo = [Int]()

    func findParentsTwo(_ node: Int) {
        parentTwo.append(node)
        guard let parent = tree[node] else {
            return
        }
        findParentsTwo(parent)
    }

    findParentsTwo(nodeTwo)

    func compare(_ arr1: [Int], _ arr2: [Int]) -> Int {
        var result = 0
        
        if arr1.count > arr2.count {
            outerLoop: for i in arr2 {
                for j in arr1 {
                    if i == j {
                        result = i
                        break outerLoop
                    }
                }
            }
        } else {
            outerLoop: for i in arr1 {
                for j in arr2 {
                    if i == j {
                        result = i
                        break outerLoop
                    }
                }
            }
        }
        
        return result
    }

    print(compare(parentOne, parentTwo))
}
