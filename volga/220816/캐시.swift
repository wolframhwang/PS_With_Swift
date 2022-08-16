import Foundation
// Cache Hit: 1, Cache Miss: 5
class Node {
    let citiName: String
    var left: Node?
    var right: Node?
    init(_ citiName: String, _ left: Node?, _ right: Node?) {
        self.citiName = citiName
        self.left = left
        self.right = right
    }

    func pop() {
        left?.right = right
        right?.left = left
    }
}

let front: Node? = Node("-", nil, nil)
let rear: Node? = Node("-", nil, nil)
var size = 0

func isHitCache(_ city: String) -> Node? {
    var node = front?.right
    while node?.citiName != rear?.citiName {
        if let cityName = node?.citiName, cityName == city {             
            return node
        }
        node = node?.right
    }
    return nil
}

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var answer = 0
    front?.right = rear
    rear?.left = front

    for city in cities {
        let citi = city.uppercased()
        let isNode = isHitCache(citi)
        if  isNode != nil {
            answer += 1
            isNode?.pop()
            front?.right?.left = isNode
            isNode?.right = front?.right
            front?.right = isNode
            isNode?.left = front
        } else {
            answer += 5
            let nowNode = Node(citi, front, front?.right)
            front?.right?.left = nowNode
            front?.right = nowNode
            size += 1
            if size > cacheSize {
                rear?.left?.pop()
                size -= 1
            }
        }        
    }

    return answer
}
